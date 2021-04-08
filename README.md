

# Order Management System
This app is for the working professional, who may have various projects and or organizations that they're apart of. With this app, one can create a user account, create and become an admin of an organization, add viewers to that organization, and create and update orders.

## Download and Setup
To download this repository be sure to have rails 6.1.3 and that you are using the latest stable version of nodejs installed on your local machine. Fork and clone this repository onto your machine.
Be sure to run ``` bundle install ```
This will download all the necessary gems.

### Migration
To migrate files into the database be sure to run ``` rails db:migrate ``` 
### Browser
Run ``` rails s ``` to begin a local server and navigate to http://localhost:3000
> If you run into an issue with Javascript pack_tag; comment that line out of #app/views/layouts files.

### Google Authentication
In order to use google authentication, you will need to utlitize your own google app with its corresponding google id and secret, those variables are not included in this git repository.

## User Experiernce

Navigating to the root will present you with a standard screen to use one of three options
- Login
- Signup
- Google Login/Signup

Either create a new accout by selecting "signup" or utilize the google signin page. Using google will autamatically create an account with a randomized encrypted password.

On success this will navigate you to the user dashboard page. Here you can create a new organization to be admin of, or navigate to an organization's page.

### As Admin
On selecting an organization that you are an admin of, you will be directed to the organization's admin page. Here you can add other accounts to be viewers of this organization. 
> Note you cannot create new users from here, only connect existing users to this organization

### As Viewer
On selecting an organization that you are not an admin of, you will be directed directly to the orders page, and will not have access to the admin dashboard.

### Basic Order Management

In order to create a new order, we need to have a product.
On the new product page you can create a new product
On the show product page you can add sub-products that make up the components of the target product

On the orders page, we can create a new order, and view existing orders


