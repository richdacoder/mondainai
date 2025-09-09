# Mondainai

**Mondainai** is an app that helps connect people who want to give things away with people who need them. It reduces friction in:  
- Posting items to give away  
- Selecting a date to meet for the trade  
- Communicating with someone who speaks Japanese  

### ✨ Special Features
- 🖼️ **AI Auto-Description Generator** – Take a picture of the item, and the app automatically generates a description.  
- 🌐 **Japanese Translation** – The app translates messages to help users communicate seamlessly.  

<div align="center">

<img width="200" alt="Screenshot 1" src="https://github.com/user-attachments/assets/08e216d4-cd55-4d42-81f0-d61ac7e002b5" />
<img width="200" alt="Screenshot 2" src="https://github.com/user-attachments/assets/716256e6-a569-4f08-8d9e-36199a17c9ad" />
<img width="200" alt="Screenshot 3" src="https://github.com/user-attachments/assets/ee875ade-02e3-4825-89c6-b53c907326a0" />
<img width="200" alt="Screenshot 4" src="https://github.com/user-attachments/assets/8f9bfaf5-1c84-4aa0-ad30-17e5d01ec475" />

</div>

<br>

App home: https://mondainai-47173af47006.herokuapp.com/

   

## Getting Started
### Setup

Install gems
```
bundle install
```

### ENV Variables
Create `.env` file
```
touch .env
```
Inside `.env`, set these variables. For any APIs, see group Slack channel.
```
CLOUDINARY_URL=your_own_cloudinary_url_key
```

### DB Setup
```
rails db:create
rails db:migrate
rails db:seed
```

### Run a server
```
rails s
```

## Built With
- [Rails 7](https://guides.rubyonrails.org/) - Backend / Front-end
- [Stimulus JS](https://stimulus.hotwired.dev/) - Front-end JS
- [Heroku](https://heroku.com/) - Deployment
- [PostgreSQL](https://www.postgresql.org/) - Database
- [Bootstrap](https://getbootstrap.com/) — Styling
- [Figma](https://www.figma.com) — Prototyping

## Acknowledgements

## Team Members
- [Richard Williams](www.linkedin.com/in/richard-williams-65a39b33a)
- [Alonzo Mori](http://www.linkedin.com/in/alonzomori)
- [Andrew Leemhuis](https://www.linkedin.com/in/andrew-leemhuis-01482718/)

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
This project is licensed under the MIT License
