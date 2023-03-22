# Footsteps - Connecting Hikers One Step at a time 🦶
### About
</p>Welcome to Footsteps, a mobile app designed to connect hikers together and make planning your next hiking adventure easy and fun.</p>
<p>Footsteps allows users to find and connect with other hikers in their area, so that you can have a hiking buddy to explore the great outdoors with. Whether you're a seasoned hiker or just starting out, Footsteps has everything you need to plan your next hike, including route plotting and messaging features to make communication with your hiking partner/group easy and simple.</p>
<p>With Footsteps, you can easily search for hikes in your area, or add your own favorite hikes for others to discover. You can also message others to coordinate logistics, share tips, and make new friends.</p>
<p>Our goal at Footsteps is to build a community of like-minded individuals who share a passion for hiking and the outdoors. We believe that connecting people who love to hike is the best way to make hiking more accessible and enjoyable for everyone.</p>
<p>Thank you for choosing Footsteps to plan your next hiking adventure. Happy hiking!</p>


## The App in Use
1. Search for where you want to go hiking and view the hikes in your area!

![Footsteps-gif-1](https://user-images.githubusercontent.com/84138514/226927879-bf7ac2b5-8937-4a4c-907d-4b57034f8d4c.gif)
<br>
2. If you are the owner of the hike you can plot a route, this will be updated for all those included in the hike. The distance will also be updated in accordance with this!

![footsteps-route-plot-gif](https://user-images.githubusercontent.com/84138514/226932454-4e3eb78a-ee5e-4923-9ced-38de3803b350.gif)
<br>
## How to Install and Run Footsteps

N.B All `$` refer to terminal commands

1. Make sure you have yarn and rails intalled on your machine by checking the current version:
```
$ yarn -v
$ rails --version
```
If yarn is not installed use the following command to install it:
```
$ npm install --global yarn
```
Follow the same process if you do not have rails installed:
```
$ gem install rails
```
If this has not worked, please refer to the docs<br><br>

2. Install all the dependencies - Need to install the ruby gems from the gemfile and the dependencies from package.json
```
$ bundle install && yarn install
```
3. To create the database and utilise our current seed data, use the following command:
```
$ rails db:create db:migrate db:seed
```

4. You must generate your own API keys for Cloudinary and Mapbox in order to use Footsteps<br>
Create a `.env` file and paste in your [Cloudinary key](https://cloudinary.com/documentation/image_upload_api_reference) and [Mapbox key](https://docs.mapbox.com/help/getting-started/access-tokens/)

5. Launch a rails server and yarn
```
$ bin/dev
```
6. See the app, up and running on your [localhost](http://localhost:3000/)!


