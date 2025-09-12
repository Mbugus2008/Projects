# Flutter Invoicing App - Dynamics 365 Integration Architecture

## Updated Project Overview

This Flutter application integrates with Microsoft Dynamics 365 to provide a comprehensive mobile invoicing and payment management solution. The app leverages Dynamics 365's robust CRM and ERP capabilities while providing a modern, user-friendly mobile interface.

## Architecture Overview

### Frontend (Flutter Mobile App)
- **Framework**: Flutter (latest stable version)
- **State Management**: GetX
- **UI Components**: Material Design 3
- **Authentication**: OAuth 2.0 with Azure AD
- **Local Storage**: SQLite for offline caching
- **HTTP Client**: Dio for API communication

### Backend (Microsoft Dynamics 365)
- **Platform**: Dynamics 365 Customer Engagement
- **API**: Dynamics 365 Web API (OData v4.0)
- **Authentication**: Azure Active Directory (OAuth 2.0)
- **Entities**: Account, Contact, Invoice, Quote, Product, Payment

## Dynamics 365 Entity Mapping

### Customer Management
- **D365 Entity**: `account` (Business accounts) and `contact` (Individual customers)
- **Key Fields**:
  - `name` - Customer/Company name
  - `emailaddress1` - Primary email
  - `telephone1` - Primary phone
  - `address1_line1` - Street address
  - `address1_city` - City
  - `address1_stateorprovince` - State/Province
  - `address1_postalcode` - Postal code
  - `address1_country` - Country

### Invoice Management
- **D365 Entity**: `invoice`
- **Key Fields**:
  - `invoicenumber` - Invoice number
  - `customerid` - Reference to account/contact
  - `datedelivered` - Issue date
  - `duedate` - Due date
  - `totalamount` - Total amount
  - `totallineitemamount` - Subtotal
  - `totaltax` - Tax amount
  - `totaldiscountamount` - Discount amount
  - `statecode` - Status (Active, Paid, Cancelled)
  - `description` - Notes

### Invoice Line Items
- **D365 Entity**: `invoicedetail`
- **Key Fields**:
  - `invoiceid` - Reference to invoice
  - `productdescription` - Item description
  - `quantity` - Quantity
  - `priceperunit` - Unit price
  - `extendedamount` - Total price

### Payment Tracking
- **D365 Entity**: Custom entity `new_payment` or use `salesorder` with payment tracking
- **Key Fields**:
  - `new_invoiceid` - Reference to invoice
  - `new_amount` - Payment amount
  - `new_paymentmethod` - Payment method
  - `new_paymentdate` - Payment date
  - `new_referencenumber` - Reference number
  - `new_notes` - Payment notes

## Authentication Flow

### OAuth 2.0 with Azure AD
```
1. User opens app
2. App redirects to Azure AD login
3. User authenticates with Microsoft credentials
4. Azure AD returns authorization code
5. App exchanges code for access token
6. App uses token for Dynamics 365 API calls
7. Token refresh handled automatically
```

### Required Azure AD App Registration
- **Application Type**: Public client (mobile)
- **Redirect URI**: `com.invoiceapp.invoicemanager://auth`
- **API Permissions**:
  - Dynamics CRM user_impersonation
  - Microsoft Graph User.Read (for user profile)

## API Integration Architecture

### Service Layer Structure
```
lib/app/data/services/
├── d365_auth_service.dart          # OAuth 2.0 authentication
├── d365_api_service.dart           # Base API service
├── d365_customer_service.dart      # Customer operations
├── d365_invoice_service.dart       # Invoice operations
├── d365_payment_service.dart       # Payment operations
└── offline_sync_service.dart       # Offline synchronization
```

### Data Flow
```
UI Layer (GetX Controllers)
    ↓
Business Logic Layer (Services)
    ↓
API Layer (Dynamics 365 Web API)
    ↓
Local Cache (SQLite for offline)
```

## Key Dependencies for D365 Integration

```yaml
dependencies:
  # OAuth 2.0 Authentication
  oauth2: ^2.0.2
  flutter_appauth: ^6.0.2
  
  # HTTP and API
  dio: ^5.3.2
  dio_certificate_pinning: ^4.1.0
  
  # Secure Storage
  flutter_secure_storage: ^9.0.0
  
  # JSON Serialization
  json_annotation: ^4.8.1
  
  # Offline Storage
  sqflite: ^2.3.0
  hive: ^2.2.3
  
  # Connectivity
  connectivity_plus: ^5.0.1

dev_dependencies:
  # Code Generation
  json_serializable: ^6.7.1
  build_runner: ^2.4.7
```

## Dynamics 365 Web API Endpoints

### Base Configuration
- **Base URL**: `https://[org].crm.dynamics.com/api/data/v9.2/`
- **Authentication**: Bearer token in Authorization header
- **Content-Type**: `application/json`
- **OData-MaxVersion**: `4.0`

### Customer Operations
```
GET    /accounts                           # List customers (companies)
GET    /contacts                           # List customers (individuals)
POST   /accounts                           # Create customer (company)
POST   /contacts                           # Create customer (individual)
PATCH  /accounts({id})                     # Update customer (company)
PATCH  /contacts({id})                     # Update customer (individual)
DELETE /accounts({id})                     # Delete customer (company)
DELETE /contacts({id})                     # Delete customer (individual)
```

### Invoice Operations
```
GET    /invoices                           # List invoices
GET    /invoices({id})                     # Get invoice details
GET    /invoices({id})/invoicedetails      # Get invoice line items
POST   /invoices                           # Create invoice
PATCH  /invoices({id})                     # Update invoice
POST   /invoicedetails                     # Add line item
PATCH  /invoicedetails({id})               # Update line item
DELETE /invoicedetails({id})               # Delete line item
```

### Payment Operations
```
GET    /new_payments                       # List payments
POST   /new_payments                       # Record payment
PATCH  /new_payments({id})                 # Update payment
```

## Offline Capability

### Local SQLite Schema
- Mirror D365 entities for offline access
- Store sync timestamps for conflict resolution
- Queue operations for when online

### Sync Strategy
- **Download**: Fetch recent changes from D365 on app start
- **Upload**: Push local changes when connectivity restored
- **Conflict Resolution**: Last-write-wins with user notification

## Security Considerations

### Data Protection
- **Token Storage**: Use Flutter Secure Storage for OAuth tokens
- **Certificate Pinning**: Implement SSL certificate pinning
- **Data Encryption**: Encrypt sensitive local data
- **Session Management**: Automatic token refresh and logout

### API Security
- **Rate Limiting**: Implement client-side rate limiting
- **Error Handling**: Secure error messages (no sensitive data)
- **Audit Trail**: Log API operations for compliance

## Performance Optimization

### Caching Strategy
- **Entity Caching**: Cache frequently accessed entities
- **Image Caching**: Cache customer logos and signatures
- **Pagination**: Implement server-side pagination for large datasets

### Network Optimization
- **Batch Requests**: Use OData batch operations
- **Selective Fields**: Request only needed fields with `$select`
- **Compression**: Enable GZIP compression
- **Connection Pooling**: Reuse HTTP connections

## Development Environment Setup

### Dynamics 365 Trial Setup
1. Sign up for Dynamics 365 trial
2. Configure Customer Engagement apps
3. Create custom entities if needed
4. Set up sample data

### Azure AD Configuration
1. Register application in Azure Portal
2. Configure redirect URIs
3. Set API permissions
4. Generate client credentials

### Flutter Configuration
1. Add OAuth redirect scheme to platform configs
2. Configure deep linking
3. Set up environment variables for D365 URLs

## Testing Strategy

### Unit Tests
- Service layer methods
- Data model serialization
- Authentication flows

### Integration Tests
- D365 API connectivity
- CRUD operations
- Offline sync scenarios

### User Acceptance Tests
- End-to-end workflows
- Performance under load
- Offline/online transitions

## Deployment Considerations

### App Store Requirements
- Privacy policy for data collection
- Terms of service
- Data handling compliance (GDPR, etc.)

### Enterprise Distribution
- Mobile Device Management (MDM) support
- App wrapping for additional security
- Custom branding options

## Future Enhancements

### Advanced Features
- Power BI integration for analytics
- Power Automate workflows
- AI-powered insights
- Multi-language support

### Scalability
- Multi-tenant support
- Custom entity support
- Plugin architecture
- White-label solutions

