![signature](https://github.com/HiQuang210/MKBookJ2EE/assets/119526513/8d9dd2b0-db47-48ff-9898-ed7e3a0d07f6)

# MKBook - Bookstore Management Web App

## Introduction
MKBook is a web-based bookstore management application developed using **Java, JSP, MySQL, and Apache Maven**. The application enables bookstore staff to manage book inventory, process sales, track orders, and generate reports efficiently.

## Features
- **Book Management**: Import, update, and remove books from the inventory.
- **Sales Processing**: Process book sales and generate invoices.
- **Order Management**: Track and manage customer orders.
- **Search Functionality**: Find books quickly using various filters.
- **Report Generation**: Generate sales reports and inventory insights.

## Requirements
- **Java Development Kit (JDK) 8+**
- **Apache Maven** 
- **Apache Tomcat 9+** 
- **MySQL Server**
- **An IDE (Eclipse/IntelliJ IDEA/NetBeans)** (optional but recommended)

## Setup and Run Instructions

### 1. Clone the Repository
```sh
git clone https://github.com/your-repository/MKBook.git
cd MKBook
```

### 2. Configure MySQL Database
- Create a new database in MySQL:
  ```sql
  CREATE DATABASE mkbook;
  ```
- Import the provided database schema (`mkbook.sql`) into MySQL.
- Update the `database.properties` file with your MySQL credentials:
  ```properties
  db.url=jdbc:mysql://localhost:3306/mkbook
  db.user=root
  db.password=yourpassword
  ```

### 3. Build the Project with Maven
```sh
mvn clean install
```

### 4. Deploy the Application on Tomcat
- Copy the generated WAR file from the `target` folder to Tomcat's `webapps` directory.
- Start the Tomcat server:
  ```sh
  catalina.sh run  # Linux/macOS
  catalina.bat run  # Windows
  ```

### 5. Access the Application
Once the server is running, open your browser and go to:
```sh
http://localhost:8080/MKBook
```

