## What is this project?

## Who's involved in the project:

([http://rhokbrisbane.org](http://rhokbrisbane.org))

## Project Introduction and Roadmap

There are currently 2 types of users. Administrators of HummingBird house, and everyone else.

Administrators can do whatever they want. Everyone else can:
- Search for people, and for resources.
- Update their own details:
    - Your address, localised yourself in search results if you choose to be visible to others.
    - Add Notes
        - share notes, so that they become visible to others.
    - Save searches, to be repeated in the future.
        - These searches are mostly intended for searches that aren't just about a kid. Maybe it's about finding financial support, or dealing with a lack of sleep. It's a good place to make ad-hoc searches, or to save regular searches that you might not like to share with other guardians of a child.
    - Add kids
        - Kids in many ways act as a saved search, but can have multiple guardians. You can add information (tags) about your child and his/her symptoms, and these will be used to generate a regular search on your child's behalf.
- Add Resources
    - Resources are the whole point of Kidzcanzimbabwe.
    - Please create lots of them, and share them with everyone.
    - You can add addresses to resources, to help people find services / information / anything near them.
    - You can tag resources, even if you didn't create them.
    - You can comment on Resources.

- Modify or remove anything they've added
- Share things (themselves, notes, resources, kids) with individual people, or with groups.

> If someone else made something, and hasn't shared it with you, or a group you're in, you can't see it.

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
