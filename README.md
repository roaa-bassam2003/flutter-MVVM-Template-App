# Flutter MVVM Service App

## Table of Contents
- [Introduction](#introduction)
- [Project Overview](#project-overview)
  - [Purpose and Scope](#purpose-and-scope)
  - [Target Audience](#target-audience)
- [User Flow](#user-flow)
  - [Client User Flow](#client-user-flow)
  - [Service Provider User Flow](#service-provider-user-flow)
- [App Flow](#app-flow)
  - [Navigation Structure](#navigation-structure)
  - [Screen Breakdown](#screen-breakdown)
- [Architecture (MVVM)](#architecture-mvvm)
  - [Model](#model)
  - [View](#view)
  - [ViewModel](#viewmodel)
  - [State Management](#state-management)
  - [Folder Structure](#folder-structure)
- [Setup and Installation](#setup-and-installation)
- [Contributing](#contributing)
- [License](#license)

---

## Introduction
**Flutter MVVM Service App** is a cross-platform mobile application built with Flutter and Dart. It connects clients with professional service providers, such as nurses, housekeepers, babysitters, and pet caregivers.  

The app follows the **Model-View-ViewModel (MVVM)** architecture for scalability, maintainability, and a seamless user experience. It supports secure payments, real-time communication, and intuitive booking management.

---

## Project Overview

### Purpose and Scope
The app streamlines hiring professional services by providing a platform where:
- Clients can browse, book, and manage services.
- Service providers can manage schedules and earnings.
- Future enhancements can be integrated easily thanks to a scalable architecture.

**Features include:**
- User authentication with role-based access (clients and providers)
- Service browsing and real-time booking
- Secure payment processing
- Profile management
- Notifications and booking history

### Target Audience
- **Clients:** Individuals seeking healthcare, home maintenance, childcare, or pet care services.
- **Service Providers:** Verified professionals offering services.
- **Developers:** Contributors leveraging the MVVM structure.
- **Stakeholders:** Business owners or investors interested in app scalability.

---

## User Flow

### Client User Flow
1. **Onboarding:** Splash screen, sign up/login, tutorial carousel.
2. **Service Selection:** Browse categories, filter/search providers.
3. **Booking Process:** View provider profiles, select date/time, make payments.
4. **Service Management:** Receive notifications, rate providers, cancel/reschedule.
5. **Profile and History:** Update personal info, view bookings, access support.

### Service Provider User Flow
1. **Registration & Verification:** Submit credentials, profile setup.
2. **Managing Requests:** Accept/decline bookings, schedule management.
3. **Service Delivery:** Mark start/end of services, communicate with clients.
4. **Profile Management:** Update availability, rates, view earnings and reviews.

---

## App Flow

### Navigation Structure
- **Bottom Navigation Bar:** Home, Bookings, Profile, Support.
- **Drawer Menu:** Settings, FAQs, Logout.
- **Stack Navigation:** For modals like booking forms and payment screens.

### Screen Breakdown
1. **Splash Screen:** App logo, authentication check.
2. **Authentication Screens:** Login, Signup, Verification.
3. **Home Screen:** Service categories, search, filters.
4. **Provider Listing Screen:** Scrollable cards of providers.
5. **Provider Profile Screen:** Bio, certifications, reviews, availability.
6. **Booking Flow:** Booking form, payment, confirmation, tracking.
7. **Provider Dashboard:** Pending/upcoming/completed bookings, earnings chart.
8. **Profile Screen:** Edit info, manage bookings, payment methods, credentials.

---

## Architecture (MVVM)

### Model
- Represents data entities like `User`, `ServiceProvider`, `Booking`, `Service`.
- Handles API calls and local storage via repositories (e.g., `BookingRepository`).

### View
- Flutter widgets for the UI.
- Listens to ViewModel state changes.
- Example: `BookingScreen` displays a form and calls `BookingViewModel.createBooking()`.

### ViewModel
- Contains business logic.
- Exposes data to the View.
- Updates UI reactively using state management.

### State Management
- Uses **Riverpod** for reactive state updates.
- Views consume providers to display updated data in real-time.

<img width="450" height="847" alt="3" src="https://github.com/user-attachments/assets/6180327a-87ea-4d55-a505-d635ce9af5b9" />
<img width="448" height="847" alt="2" src="https://github.com/user-attachments/assets/26e1d283-6558-45b1-b195-b96b1a506fcb" />
<img width="449" height="847" alt="1" src="https://github.com/user-attachments/assets/51f440c2-05e0-4854-9bc0-68c57f74c70b" />
<img width="453" height="850" alt="12" src="https://github.com/user-attachments/assets/24a89fcd-c712-47a2-bfb9-24224e89b106" />
<img width="452" height="850" alt="11" src="https://github.com/user-attachments/assets/8b8a889e-154f-4a60-9d7c-a2e89b959ea6" />
<img width="450" height="847" alt="10" src="https://github.com/user-attachments/assets/114253d0-ddd8-47f8-849a-fa88f0c9a18e" />
<img width="446" height="847" alt="9" src="https://github.com/user-attachments/assets/628496fa-5cae-4497-abae-180eb1476da5" />
<img width="450" height="820" alt="8" src="https://github.com/user-attachments/assets/15f2e034-2f2d-4a52-b4b2-9611b97e5293" />
<img width="450" height="819" alt="7" src="https://github.com/user-attachments/assets/fcf05153-4a1f-4585-8dac-7f2808706e7e" />
<img width="450" height="819" alt="6" src="https://github.com/user-attachments/assets/8236cfec-55e0-42b3-b7db-0f2d25b7ea8b" />
<img width="452" height="821" alt="5" src="https://github.com/user-attachments/assets/fb195f8b-28b4-464f-a448-7240928133a4" />
<img width="450" height="850" alt="4" src="https://github.com/user-attachments/assets/7f4f0014-8126-4fd2-bad3-48f49fc6d551" />
<img width="449" height="848" alt="15" src="https://github.com/user-attachments/assets/78cfbaab-779b-407f-a855-0ac3dc35f011" />
<img width="449" height="849" alt="14" src="https://github.com/user-attachments/assets/13918747-4eca-4435-a39b-c05851fc56d3" />
<img width="451" height="853" alt="13" src="https://github.com/user-attachments/assets/f0937459-3c90-4eca-a3e7-3e8f8af3fc75" />
<img width="450" height="850" alt="12" src="https://github.com/user-attachments/assets/b476cb7d-6297-44a4-a9b8-258226d93963" />
<img width="452" height="848" alt="11" src="https://github.com/user-attachments/assets/472f84c4-d23f-47f9-a5f4-6e9ef8d3aab8" />
<img width="448" height="850" alt="10" src="https://github.com/user-attachments/assets/75767582-d68a-4a0b-b2af-f93db5d4b4cd" />
<img width="452" height="851" alt="9" src="https://github.com/user-attachments/assets/03b7e906-c571-49c1-afc9-4590cd465817" />
<img width="447" height="849" alt="8" src="https://github.com/user-attachments/assets/371f2535-bfec-4bf4-8b7a-9b6db65570f7" />
<img width="446" height="845" alt="7" src="https://github.com/user-attachments/assets/5c3c6d36-48c2-4900-b859-876f85f3de17" />
<img width="452" height="851" alt="6" src="https://github.com/user-attachments/assets/1450d762-c98c-4ff5-bbd8-6b4d1b6b88af" />
<img width="451" height="851" alt="5" src="https://github.com/user-attachments/assets/2fed80ae-e107-4d3d-95fc-73ebaba871d5" />
<img width="450" height="845" alt="4" src="https://github.com/user-attachments/assets/b0777181-d198-4b32-a5b2-4f11d8ecbb1d" />
<img width="445" height="849" alt="3" src="https://github.com/user-attachments/assets/d610027e-1ef1-466c-8aba-64588ec95cf2" />
<img width="448" height="851" alt="2" src="https://github.com/user-attachments/assets/49861c33-8c48-4908-8cd1-658e3fdc7198" />
<img width="447" height="845" alt="1" src="https://github.com/user-attachments/assets/96d53221-5150-47bf-81aa-f7b44d50d1e0" />
<img width="447" height="850" alt="18" src="https://github.com/user-attachments/assets/be7760d2-1268-439f-9a45-bd14197997b6" />
<img width="448" height="846" alt="17" src="https://github.com/user-attachments/assets/f22c995f-624c-4fb7-bda4-279587081dcd" />
<img width="455" height="847" alt="16" src="https://github.com/user-attachments/assets/91e549b7-b500-43d9-974e-7a0db12ae1a2" />
<img width="449" height="849" alt="26" src="https://github.com/user-attachments/assets/fb65ac6e-d1c6-46f9-a363-2851ad2e0794" />
<img width="451" height="849" alt="25" src="https://github.com/user-attachments/assets/67964abe-14f5-4663-9aba-7f4afc65ae8d" />
<img width="453" height="849" alt="24" src="https://github.com/user-attachments/assets/39eda1c2-c88f-4fc4-9b93-c070cf33f726" />
<img width="453" height="850" alt="23" src="https://github.com/user-attachments/assets/22f4aaa1-602b-4451-9cc2-0e030f314b7d" />
<img width="452" height="850" alt="22" src="https://github.com/user-attachments/assets/c6eb8997-1455-4cdc-8850-0bde5de1a209" />
<img width="449" height="848" alt="21" src="https://github.com/user-attachments/assets/9dac1217-47dd-4cc7-90d8-2b712bb4cbc9" />
<img width="449" height="848" alt="20" src="https://github.com/user-attachments/assets/4366644e-5a2c-4c2d-bf12-e6b17ec20801" />
<img width="453" height="848" alt="19" src="https://github.com/user-attachments/assets/333a0f9a-339d-4ad6-bc60-c4c308e0672c" />
<img width="449" height="849" alt="18" src="https://github.com/user-attachments/assets/8ed14f16-2a91-46ad-a5bc-564b51da9cf6" />
<img width="450" height="850" alt="17" src="https://github.com/user-attachments/assets/def721f9-8440-4c7f-a6d6-39cf449e0a37" />
<img width="451" height="849" alt="16" src="https://github.com/user-attachments/assets/ae85ffe5-b516-4d98-b9ed-02d6c3076a77" />
<img width="451" height="851" alt="15" src="https://github.com/user-attachments/assets/790f266e-4c47-47ea-85d5-49bfdfdbead5" />
<img width="453" height="850" alt="14" src="https://github.com/user-attachments/assets/87b79e34-8290-4fd7-9793-aebf01ae5e97" />
<img width="451" height="851" alt="13" src="https://github.com/user-attachments/assets/9f145ff4-d5bc-46e6-adbb-6d0c331f7334" />
<img width="449" height="850" alt="12" src="https://github.com/user-attachments/assets/702d9417-56da-46a9-9eee-fc08b9e6e217" />
<img width="451" height="846" alt="11" src="https://github.com/user-attachments/assets/f27503d0-8909-4d9b-965c-965d949cfa5d" />
<img width="450" height="848" alt="10" src="https://github.com/user-attachments/assets/7d53ea0a-ec4a-4cd3-a48a-bcd30c8532c6" />
<img width="453" height="851" alt="9" src="https://github.com/user-attachments/assets/4c6a222a-1697-41c2-bd70-04d273669d08" />
<img width="450" height="844" alt="8" src="https://github.com/user-attachments/assets/6891d6eb-56b0-4f8a-a43c-a141be3f99fa" />
<img width="450" height="849" alt="7" src="https://github.com/user-attachments/assets/3c638775-6fe3-4a86-9404-55ab917915ee" />
<img width="452" height="852" alt="6" src="https://github.com/user-attachments/assets/9dee2f5e-f011-48f3-a7df-6b0915de739c" />
<img width="451" height="850" alt="5" src="https://github.com/user-attachments/assets/df5d012b-dac6-40c1-8be7-d05a79ee7dbd" />
<img width="450" height="849" alt="4" src="https://github.com/user-attachments/assets/edff2789-14ff-43c6-802e-197614a071eb" />
<img width="450" height="848" alt="3" src="https://github.com/user-attachments/assets/40507b0b-3d02-47a5-9213-d222d55210a4" />
<img width="448" height="847" alt="2" src="https://github.com/user-attachments/assets/ddf9bbec-b6c5-41c9-9b8a-197e3251cabe" />
<img width="449" height="853" alt="1" src="https://github.com/user-attachments/assets/2d76f501-6ab3-4743-9ea1-6a4c193f5dc1" />
<img width="452" height="848" alt="27" src="https://github.com/user-attachments/assets/da37dbbf-ea19-44c9-a82b-41f01cfbe138" />

