# README

Steps:

1. run `rails new magic8-ball-hotline  --api --skip-active-record`

2. cd into new folder & open it up in any text editor

3. add a  `responses_controller.rb` file. In there, create `answer`, `caller_input`, and `event` methods

4. define routes to your methods in `routes.rb`

5. connect ngrok (to be `NGROK_URL` in `responses_controller.rb`)

6. create a new voice app using that `NGROK_URL`

7. buy and connect your Nexmo phone number to your voice application

8. run `rails s` and call your new Nexmo phone number to get some sage advice and answer your burning questions 
