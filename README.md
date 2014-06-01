
## What is this project?
- Kidzcan Hub was built for Kizcanzimbabwe.org as a project for RHoKBrisbane.org
- It seeks to solve their decentralised data problem, whilst assiting them to manage their patients records, resource directory, and to create compelling reports to assist in thir fundraising.
- SMS support for patients will be integrated in asap.

## Who's involved in the project:

([http://kidzcanzimbabwe.netengine.com.au](http://kidzcanzimbabwe.netengine.com.au))

## Project Introduction and Roadmap

There are currently 2 types of users. Administrators of Kidzcan, and patients.

Administrators can :
- Add Patients
- Search for people, and for resources.
- Update their own details:
    - Your address, localised yourself in search results if you choose to be visible to others.
    - Add Notes
        - share notes, so that they become visible to others.
- Add Resources
    - Resources are the whole point of Kidzcan Hub.
    - Please create lots of them, and share them with everyone.
    - You can add addresses to resources, to help people find services / information / anything near them.
    - You can tag resources, even if you didn't create them.
    - You can comment on Resources.

- Modify or remove anything they've added

Patiends can :
- Currently do nothing, their ability to login and browse resources is currently disabled until Kidzcan believe there is a need for this.

#Plan

must do:
- create / manage patients (patients)
- need to access patient data offline (offline)
- need to create new patients (patients)
- need to manage existing patients (patients)
- need to remove deceased patients (patients)
- need to export my expenditure per region/ patient/ condition (reporting)

should do:
- produce / export reports (reporting)
- provide offline continuity (offline)
- need to manage patients offline (offline)
- need to upload offline data dependent on “manage patients offline” (offline)
- need to export patient locations (reporting)
- need to send SMS at predefined times (SMS)
- batch trigger
- based on patient data
- need to paginated sort of patients (UX/UI)
- need simplified starting points (UX/UI)
- add, search, report, admin

could do:
- simplify workflow (UX/UI)
- produce SMS reminders (SMS)
- need to create patients offline (offline)
- need to assign a user to a patient (patients)
- user can sign up independently
- need to add datafiles as required (patients)


## Servers

### Development

To get our [sass](http://sass-lang.com/) framework you need [node](http://nodejs.org/) and [bower](http://bower.io/)

    bower install

Access it through `http://lvh.me:3000`, site url is a requirement for Facebook Authentication

Start the server passing the Facebook credentials (the length below is correct, the values are not):

    export HH_FACEBOOK_APP_ID=560486987363815
    export HH_FACEBOOK_APP_SECRET=f1dc56416a941b380c1410f44b39f446
    export HH_DEVISE_SECRET_KEY=62caa77c37f8e92d7562e06427766ce1a8e71d7c92f2ce26e46a6f3f035f6a0f197a4be64a33483d79b39d7c675c4ecfc39bbcc12d9631b084e2fc16a4fff18e
    export DEVISE_SECRET_KEY=54e42d09f9198aad975e6d504dbf436483bc032311f6ed55735273ce9910f245ed220badddde98cd1926ee02c7e75fad15ac657e5953706fc898622aee8ffcb0
    rails s
        
