# Invoice Manager App - UI/UX Design System

## Design Research Analysis

Based on the research of modern invoicing applications, several key design patterns and trends have been identified:

### Common UI Patterns
1. **Clean, Minimalist Interface** - Most successful invoicing apps use clean layouts with plenty of white space
2. **Card-Based Design** - Information is organized in cards for better visual hierarchy
3. **Bottom Navigation** - Primary navigation is typically at the bottom for mobile accessibility
4. **Status Indicators** - Clear visual indicators for invoice status (draft, sent, paid, overdue)
5. **Quick Actions** - Prominent action buttons for common tasks (create invoice, record payment)
6. **Dashboard Overview** - Summary cards showing key metrics and recent activities

### Color Psychology for Financial Apps
- **Blue**: Trust, reliability, professionalism (primary color)
- **Green**: Success, money, positive actions (payments, completed)
- **Orange/Yellow**: Attention, pending actions (due soon, warnings)
- **Red**: Urgent, overdue, errors
- **Gray**: Neutral, secondary information

## Design System Specifications

### Color Palette

#### Primary Colors
- **Primary Blue**: #2196F3 (Material Blue 500)
- **Primary Dark**: #1976D2 (Material Blue 700)
- **Primary Light**: #BBDEFB (Material Blue 100)

#### Secondary Colors
- **Success Green**: #4CAF50 (Material Green 500)
- **Warning Orange**: #FF9800 (Material Orange 500)
- **Error Red**: #F44336 (Material Red 500)

#### Neutral Colors
- **Background**: #FAFAFA (Material Gray 50)
- **Surface**: #FFFFFF (White)
- **Surface Variant**: #F5F5F5 (Material Gray 100)
- **Outline**: #E0E0E0 (Material Gray 300)
- **Text Primary**: #212121 (Material Gray 900)
- **Text Secondary**: #757575 (Material Gray 600)

### Typography

#### Font Family
- **Primary**: Roboto (Material Design standard)
- **Weights**: Light (300), Regular (400), Medium (500), Bold (700)

#### Text Styles
- **Headline 1**: 32sp, Bold, Primary Text
- **Headline 2**: 24sp, Bold, Primary Text
- **Headline 3**: 20sp, Medium, Primary Text
- **Body 1**: 16sp, Regular, Primary Text
- **Body 2**: 14sp, Regular, Secondary Text
- **Caption**: 12sp, Regular, Secondary Text
- **Button**: 14sp, Medium, White/Primary

### Spacing System
- **Base Unit**: 8dp
- **Spacing Scale**: 4dp, 8dp, 16dp, 24dp, 32dp, 48dp, 64dp
- **Component Padding**: 16dp
- **Screen Margins**: 16dp
- **Card Elevation**: 2dp

### Component Specifications

#### Cards
- **Corner Radius**: 12dp
- **Elevation**: 2dp
- **Padding**: 16dp
- **Margin**: 8dp vertical, 16dp horizontal

#### Buttons
- **Primary Button**: Filled, Primary Color, 48dp height, 12dp corner radius
- **Secondary Button**: Outlined, Primary Color, 48dp height, 12dp corner radius
- **Text Button**: Text only, Primary Color, 48dp height

#### Input Fields
- **Height**: 56dp
- **Corner Radius**: 8dp
- **Border**: 1dp, Outline Color
- **Focus Border**: 2dp, Primary Color
- **Padding**: 16dp horizontal, 16dp vertical

#### Status Indicators
- **Draft**: Gray circle with "D" icon
- **Sent**: Blue circle with send icon
- **Paid**: Green circle with check icon
- **Overdue**: Red circle with warning icon

## Screen Layout Specifications

### Bottom Navigation
- **Height**: 64dp
- **Items**: Dashboard, Customers, Invoices, Payments, Settings
- **Icons**: Material Design icons
- **Active State**: Primary color with label
- **Inactive State**: Gray with icon only

### App Bar
- **Height**: 56dp
- **Background**: Primary Color
- **Title**: Headline 3, White
- **Actions**: White icons, 48dp touch target

### Dashboard Layout
```
┌─────────────────────────────────────┐
│ App Bar (Invoice Manager)           │
├─────────────────────────────────────┤
│ Welcome Card                        │
│ ┌─────────────────────────────────┐ │
│ │ Good morning, User              │ │
│ │ Today's overview                │ │
│ └─────────────────────────────────┘ │
│                                     │
│ Quick Stats (2x2 Grid)              │
│ ┌───────────┐ ┌───────────────────┐ │
│ │ Total     │ │ Outstanding       │ │
│ │ Revenue   │ │ Invoices          │ │
│ └───────────┘ └───────────────────┘ │
│ ┌───────────┐ ┌───────────────────┐ │
│ │ Paid      │ │ Overdue           │ │
│ │ Invoices  │ │ Invoices          │ │
│ └───────────┘ └───────────────────┘ │
│                                     │
│ Quick Actions                       │
│ ┌─────────────────────────────────┐ │
│ │ + Create Invoice                │ │
│ │ + Record Payment                │ │
│ │ + Add Customer                  │ │
│ └─────────────────────────────────┘ │
│                                     │
│ Recent Activity                     │
│ ┌─────────────────────────────────┐ │
│ │ Invoice #001 - Paid             │ │
│ │ Invoice #002 - Sent             │ │
│ │ Payment received - $500         │ │
│ └─────────────────────────────────┘ │
├─────────────────────────────────────┤
│ Bottom Navigation                   │
└─────────────────────────────────────┘
```

### Invoice List Layout
```
┌─────────────────────────────────────┐
│ App Bar (Invoices) [+ Add]          │
├─────────────────────────────────────┤
│ Filter Chips                        │
│ [All] [Draft] [Sent] [Paid] [Overdue]│
│                                     │
│ Invoice Cards                       │
│ ┌─────────────────────────────────┐ │
│ │ [●] INV-001    $1,085.00       │ │
│ │     John Doe                    │ │
│ │     Due: Dec 15, 2024          │ │
│ │     Status: Sent               │ │
│ └─────────────────────────────────┘ │
│ ┌─────────────────────────────────┐ │
│ │ [●] INV-002    $750.00         │ │
│ │     Jane Smith                  │ │
│ │     Due: Dec 20, 2024          │ │
│ │     Status: Draft              │ │
│ └─────────────────────────────────┘ │
├─────────────────────────────────────┤
│ Bottom Navigation                   │
└─────────────────────────────────────┘
```

### Customer List Layout
```
┌─────────────────────────────────────┐
│ App Bar (Customers) [+ Add]         │
├─────────────────────────────────────┤
│ Search Bar                          │
│ ┌─────────────────────────────────┐ │
│ │ 🔍 Search customers...          │ │
│ └─────────────────────────────────┘ │
│                                     │
│ Customer Cards                      │
│ ┌─────────────────────────────────┐ │
│ │ [👤] John Doe                   │ │
│ │      john.doe@example.com       │ │
│ │      +1-555-0123               │ │
│ │      3 invoices                │ │
│ └─────────────────────────────────┘ │
│ ┌─────────────────────────────────┐ │
│ │ [👤] Jane Smith                 │ │
│ │      jane.smith@example.com     │ │
│ │      +1-555-0456               │ │
│ │      1 invoice                 │ │
│ └─────────────────────────────────┘ │
├─────────────────────────────────────┤
│ Bottom Navigation                   │
└─────────────────────────────────────┘
```

## Accessibility Guidelines

### Color Contrast
- **Text on Background**: Minimum 4.5:1 ratio
- **Large Text**: Minimum 3:1 ratio
- **Interactive Elements**: Minimum 3:1 ratio

### Touch Targets
- **Minimum Size**: 48dp x 48dp
- **Recommended Size**: 56dp x 56dp for primary actions
- **Spacing**: Minimum 8dp between touch targets

### Typography
- **Minimum Text Size**: 12sp
- **Body Text**: 14sp or larger
- **Line Height**: 1.4x font size minimum

## Animation Guidelines

### Transitions
- **Duration**: 200-300ms for most transitions
- **Easing**: Material Design standard curves
- **Page Transitions**: Slide in/out with fade

### Micro-interactions
- **Button Press**: Scale down to 0.95 with 100ms duration
- **Card Tap**: Elevation increase with 150ms duration
- **Loading States**: Shimmer effect or progress indicators

## Responsive Design

### Breakpoints
- **Mobile**: 0-599dp
- **Tablet**: 600-1023dp
- **Desktop**: 1024dp+

### Layout Adaptations
- **Mobile**: Single column, bottom navigation
- **Tablet**: Two columns where appropriate, side navigation option
- **Desktop**: Multi-column layouts, top navigation

## Implementation Notes

### Flutter Material 3
- Use Material 3 design system components
- Implement dynamic color theming
- Support both light and dark themes

### State Management
- Use GetX for reactive state management
- Implement proper loading and error states
- Maintain consistent state across navigation

### Performance
- Lazy load lists with pagination
- Optimize images and assets
- Use efficient widgets and avoid rebuilds

