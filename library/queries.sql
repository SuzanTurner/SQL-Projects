
-- Creating tables
drop table if exists books;
CREATE TABLE books (
        isbn VARCHAR primary key NOT NULL,
        book_title VARCHAR NOT NULL,
        category VARCHAR NOT NULL,
        rental_price DECIMAL NOT NULL,
        status BOOLEAN NOT NULL,
        author VARCHAR NOT NULL,
        publisher VARCHAR NOT NULL
);

drop table if exists branch;
CREATE TABLE branch (
        branch_id VARCHAR primary key NOT NULL,
        manager_id VARCHAR NOT NULL,
        branch_address VARCHAR NOT NULL,
        contact_no DECIMAL NOT NULL
);

drop table if exists employees;
CREATE TABLE employees (
        emp_id VARCHAR primary key NOT NULL,
        emp_name VARCHAR NOT NULL,
        position VARCHAR NOT NULL,
        salary DECIMAL NOT NULL,
        branch_id VARCHAR NOT NULL
);

drop table if exists issued_status;
CREATE TABLE issued_status (
        issued_id VARCHAR primary key NOT NULL,
        issued_member_id VARCHAR NOT NULL,
        issued_book_name VARCHAR NOT NULL,
        issued_date DATE NOT NULL,
        issued_book_isbn VARCHAR NOT NULL,
        issued_emp_id VARCHAR NOT NULL
);

drop table if exists members;
CREATE TABLE members (
        member_id VARCHAR primary key NOT NULL,
        member_name VARCHAR NOT NULL,
        member_address VARCHAR NOT NULL,
        reg_date DATE NOT NULL
);

drop table if exists return_status;
CREATE TABLE return_status (
        return_id VARCHAR primary key NOT NULL,
        issued_id VARCHAR NOT NULL,
        return_book_name BOOLEAN,
        return_date DATE NOT NULL,
        return_book_isbn BOOLEAN
);

-- Adding foreign key
alter table issued_status
add constraint fk_members
foreign key (issued_member_id)
references members(member_id);

alter table issued_status
add constraint fk_books
foreign key (issued_book_isbn)
references books(isbn);

alter table issued_status
add constraint fk_emps
foreign key (issued_emp_id)
references employees(emp_id);

