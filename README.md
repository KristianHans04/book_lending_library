
---

# Book Lending Library

A simple book lending library application built using Ruby on Rails. This application allows users to manage books (create, view, update, delete) and track their lending history without requiring login/authentication. Users can borrow and return books, view borrowing history, and see details about specific borrowers.

## Table of Contents

1. [Features](#features)
2. [Prerequisites](#prerequisites)
3. [Installation](#installation)
4. [Usage](#usage)
5. [Testing](#testing)
6. [Project Structure](#project-structure)
7. [Contributing](#contributing)
8. [License](#license)

---

## Features

- **Book Management**: Create, view, update, and delete books.
- **Borrowing System**: Borrow and return books with borrower's name tracking.
- **Borrowing History**: View borrowing history for each book, including who borrowed it and when it was borrowed/returned.
- **Borrower History**: View all books borrowed by a specific borrower.
- **Bootstrap Styling**: Clean and responsive UI using Bootstrap.
- **Basic Validations**: Ensure data integrity with model validations.
- **Tests**: Includes basic model and controller tests.

---

## Prerequisites

Before you begin, ensure you have the following installed:

- **Ruby**: Version 3.x (preferably 3.2.x).
- **Rails**: Version 8.x.
- **SQLite**: For database management.
- **Git**: For version control.

---

## Installation

### Step 1: Clone the Repository

```bash
git clone https://github.com/KristianHans04/book_lending_library.git
cd book_lending_library
```

### Step 2: Install Dependencies

Install the required gems using Bundler:

```bash
bundle install
```

### Step 3: Set Up the Database

Run the following commands to set up the SQLite database:

```bash
rails db:migrate
```

### Step 4: Start the Server

Start the Rails server:

```bash
rails server
```

The application will be available at `http://localhost:3000`.

---

## Usage

### Home Page (`/books`)

- Displays a list of all books in the library.
- Provides links to:
  - **View Details**: See details of a specific book, including its borrowing history.
  - **Edit**: Update book details.
  - **Delete**: Remove a book from the library.
  - **New Book**: Add a new book to the library.

### Book Details Page (`/books/:id`)

- Displays detailed information about a specific book, including:
  - Title, Author, Genre.
  - Borrowing history (who borrowed it, when it was borrowed, and when it was returned).
- Actions:
  - **Borrow**: Borrow the book by entering the borrower's name.
  - **Return**: Return the book if it is currently borrowed.
  - **Back**: Navigate back to the list of books.

### Borrowing and Returning Books

- To borrow a book:
  - Click the "Borrow" button on the book's details page.
  - Enter the borrower's name and submit the form.
- To return a book:
  - Click the "Return" button on the book's details page.

### Borrower History

- To view a specific borrower's borrowing history:
  - Borrowers are identified by their name.
  - The borrowing history is displayed on the book's details page after borrowing.

---

## Testing

This project includes basic model and controller tests to ensure functionality.

### Running Tests

To run the tests, use the following command:

```bash
rails test
```

### Test Coverage

- **Model Tests**: Validate presence of required fields in `Book` and `Borrowing` models.
- **Controller Tests**: Test CRUD operations for books and borrowing/returning functionality.

---

## Project Structure

### Models

- **Book**: Represents a book in the library.
  - Attributes: `title`, `author`, `genre`.
  - Relationships: `has_many :borrowings`.
- **Borrowing**: Represents a borrowing record.
  - Attributes: `book_id`, `borrower_name`, `borrow_date`, `return_date`.
  - Relationships: `belongs_to :book`.

### Controllers

- **BooksController**: Handles CRUD operations for books.
- **BorrowingsController**: Handles borrowing and returning actions.

### Views

- **Books Views**:
  - `index.html.erb`: Lists all books.
  - `show.html.erb`: Displays details of a specific book.
  - `new.html.erb` and `edit.html.erb`: Forms for creating and updating books.
- **Partials**:
  - `_borrow_form.html.erb`: Form for borrowing a book.
  - `_return_form.html.erb`: Form for returning a book.

### Routes

- `GET /books`: List all books.
- `GET /books/:id`: Show details of a specific book.
- `POST /books/:id/borrow`: Borrow a book.
- `POST /books/:id/return`: Return a book.

---

## Contributing

Contributions are welcome! If you'd like to contribute to this project, follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/YourFeatureName`).
3. Commit your changes (`git commit -m "Add some feature"`).
4. Push to the branch (`git push origin feature/YourFeatureName`).
5. Open a pull request.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Contact

If you have any questions or suggestions, feel free to reach out:

- GitHub: [KristianHans04](https://github.com/KristianHans04)
- Email: hello@kristianhans.com

---
