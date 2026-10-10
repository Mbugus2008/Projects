# Google Play Store Listing - Kanisa App

## App Name
**Kanisa** (or "Kanisa - Church App")

---

## Short Description (80 characters max)
```
Stay connected with your church - sermons, events, Bible & member community.
```

---

## Full Description (4000 characters max)
```
Kanisa is your all-in-one church management app designed to keep you connected with your church community.

📖 SERMONS
• Watch and listen to sermons anytime, anywhere
• Access sermon archives and past messages
• Never miss a powerful message from your pastor

📅 EVENTS
• Stay updated on upcoming church events
• View event details, dates, and times
• Plan your participation in church activities

📚 BIBLE
• Read the Bible directly within the app
• Access scriptures during services
• Grow in your faith journey

👥 MEMBER COMMUNITY
• Connect with your church family
• View member information
• Stay engaged with your church community

🔔 UPDATES
• Receive important church announcements
• Get notified about new sermons and events
• Stay informed about church news

FEATURES:
✓ Easy registration with phone number
✓ Clean and intuitive interface
✓ Fast and reliable performance
✓ Regular updates with new features
✓ Secure data handling

Kanisa is designed for churches looking to enhance member engagement and streamline communication. Whether you're catching up on a sermon you missed or checking the calendar for upcoming events, Kanisa keeps your church at your fingertips.

Download Kanisa today and stay connected with your church community!

For support or feedback, contact us at: support@trimline.co.ke
```

---

## Category
**Lifestyle** (Primary)
or **Books & Reference** (Alternative)

---

## Content Rating
- **Violence**: None
- **Sexual Content**: None
- **Language**: None
- **Controlled Substance**: None
- **User-Generated Content**: No (or minimal)

**Expected Rating**: Everyone (E)

---

## Screenshots Required

### Phone Screenshots (Required - 2 to 8)
**Dimensions**: 16:9 or 9:16 aspect ratio, minimum 320px, maximum 3840px

Recommended screenshots:
1. **Home Screen** - Show the main dashboard
2. **Sermons List** - Display available sermons
3. **Events Page** - Show upcoming events
4. **Bible Reader** - Scripture reading interface
5. **Member Profile** - User account screen
6. **Registration** - Sign-up screen

### Tablet Screenshots (Optional)
**Dimensions**: Same requirements as phone

---

## Feature Graphic (Required)
**Dimensions**: 1024 x 500 pixels
**Format**: PNG or JPEG (no alpha/transparency)

Suggested design:
- App logo centered
- Church-themed background
- Tagline: "Stay Connected with Your Church"
- Brand colors

---

## App Icon (Required)
**Dimensions**: 512 x 512 pixels
**Format**: 32-bit PNG (with alpha)

Use your existing `kirigitilogo` icon scaled to 512x512

---

## Data Safety Form Responses

### Data Types Collected
| Data Type | Collected | Shared | Purpose |
|-----------|-----------|--------|---------|
| Phone number | Yes | No | Account management |
| Name | Yes | No | User identification |
| App activity | Yes | No | App functionality |

### Security Practices
- Data encrypted in transit: **Yes** (HTTPS)
- Data can be deleted: **Yes** (User can request deletion)

---

## Contact Information for Play Console
- **Email**: support@trimline.co.ke
- **Website**: https://trimline.co.ke
- **Developer name**: Trimline Technologies
- **Privacy Policy URL**: https://trimline.co.ke/kanisa-privacy.html
- **Account deletion URL**: https://trimline.co.ke/kanisa-delete-account/

## Privacy Policy Publishing

The live privacy policy page is a plain HTML page served by the trimline.co.ke IIS site.
`privacy_policy.html` in this repository is the source of truth for that page.

- Deploy: upload `privacy_policy.html` to the site root as `kanisa-privacy.html`
  (keep the existing `kanisa.html`, `kanisa-help.html` and `kanisa-delete-account.html`
  pages; the policy links to them).
- Never point Play Console at a Markdown file or a shared document - the URL must serve a
  publicly reachable HTML page that renders without JavaScript or a login.
- Verify after every upload:

```bash
curl -s -o /dev/null -w "%{http_code} %{content_type}\n" https://trimline.co.ke/kanisa-privacy.html
# expect: 200 text/html
```

- The page must stay reachable to Google's crawlers from outside Kenya, so do not add IP
  restrictions, basic auth or bot blocking for it, and keep the TLS certificate
  (Let's Encrypt) renewing automatically.

### Account deletion URL

The URL declared in Play Console → App content → Data safety must return a real page with
HTTP 200 on the first request - no meta-refresh stub and no redirect. Keep
`kanisa-delete-account/index.html` served as the actual deletion page (it is what
`https://trimline.co.ke/kanisa-delete-account/` resolves to) and keep
`kanisa-delete-account.html` as the copy linked from inside the app.

---

## Pre-Launch Checklist

- [ ] Create Google Play Developer account ($25)
- [x] Host privacy policy at a public URL (https://trimline.co.ke/kanisa-privacy.html, from `privacy_policy.html`)
- [x] Host account deletion page (https://trimline.co.ke/kanisa-delete-account/)
- [ ] Prepare 512x512 app icon
- [ ] Create 1024x500 feature graphic
- [ ] Take 4-8 app screenshots
- [ ] Complete Data Safety form
- [ ] Complete Content Rating questionnaire
- [ ] Build release APK/AAB: `flutter build appbundle --release`
- [ ] Test on multiple devices
- [ ] Submit for review

---

## Build Commands

```bash
# Generate release app bundle for Play Store
flutter build appbundle --release

# Generate release APK (for testing)
flutter build apk --release

# Analyze app for issues
flutter analyze
```

Output location: `build/app/outputs/bundle/release/app-release.aab`
