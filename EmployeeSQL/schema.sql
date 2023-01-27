CREATE TABLE department (
    dept_no VARCHAR(50)   NOT NULL,
    dept_name VARCHAR(50) NOT NULL,
    PRIMARY KEY (dept_no)
);

CREATE TABLE titles (
    title_id VARCHAR(50)   NOT NULL,
    title VARCHAR(20) NOT NULL,
    PRIMARY KEY (title_id)
);

--Data type at original CSV file for birth_date and hire_date are object NOT date that is the reason\
--I am using VARCHAR for below data type
CREATE TABLE employees (
    emp_no INTEGER   NOT NULL,
    emp_title_id VARCHAR(50)   NOT NULL,
	birth_date VARCHAR	NOT NULL,
    frist_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
	sex VARCHAR   NOT NULL,
	hire_date VARCHAR	NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);


CREATE TABLE dept_emp (
    emp_no INTEGER   NOT NULL,
    dept_no VARCHAR(50)   NOT NULL,
    PRIMARY KEY (emp_no,dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES department(dept_no)
);


CREATE TABLE dept_manager (
    dept_no VARCHAR(50)   NOT NULL,
	emp_no INTEGER   NOT NULL,
    PRIMARY KEY (dept_no,emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES department(dept_no)
);


CREATE TABLE salaries (
    emp_no INTEGER   NOT NULL,
    salary INTEGER NOT NULL,
    PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);