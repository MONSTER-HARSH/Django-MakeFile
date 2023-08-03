# DjangoTaskMaster

This repository contains a Makefile for automating common development tasks for Django project. The Makefile allows you to simplify tasks such as setting up a virtual environment, installing requirements, running migrations, running tests, and more.

## Makefile Targets

- `help`: Display a list of available Makefile targets and their descriptions.
- `list`: List all available Makefile targets along with their descriptions.
- `venv`: Make a new virtual environment and activate it.
- `install`: Create the virtual environment and install the project's requirements.
- `freeze`: Pin current dependencies into a `requirements.txt` file.
- `migrate`: Make and run database migrations.
- `test`: Run tests for the Django project.
- `check`: Check for errors in the Django project.
- `run`: Run the Django development server.
- `auto-models`: Generate Django models from an existing database using `inspectdb`.
- `diffsettings`: Display differences between the current `settings.py` and Django's default settings.
- `showmigrations`: Show all available migrations for the current project.
- `findstatic`: Find the absolute paths for given static file(s).
- `collectstatic`: Collect static files into a single location.
- `dbshell`: Run the command-line client for the specified database or the default database.
- `flush`: Remove all data from the database, including data added during migrations.
- `sqlflush`: Return a list of the SQL statements required to return all tables in the database to the state they were in just after they were installed.
- `sqlsequencereset`: Print the SQL statements for resetting sequences for a given app name.
- `startapp`: Create a new Django app.
- `start`: Install requirements, apply migrations, then start the development server.
- `requirements-dev`: Install development-only requirements (for testing, linting, etc.).
- `clean`: Clean up temporary files and build artifacts.

## Getting Started

1. Clone the repository and navigate to the project root:
```bash
  git clone https://github.com/MONSTER-HARSH/DjangoTaskMaster.git
  cd DjangoTaskMaster
```
2. Now, you can use the following commands to perform different tasks:

- **Install**: Set up a virtual environment and install the project's requirements.
```bash
  make install
```
- **Migrate**: Apply database migrations.
```bash
  make migrate
```
- **Run**: Run the Django development server.
```bash
  make run
```
- **Clean**: Remove temporary files and build artifacts.
```bash
  make clean
```
That's it! You can use these commands in your terminal to perform the respective tasks for your Django project. Make sure you have the required dependencies installed, such as Python, Django, and Make, before running these commands.

##  Platform-Specific Instructions
⚠️ Please note that the Makefile provided in this repository is currently optimized for Linux operating systems. If you are using a different operating system, some commands may not work as expected. If you encounter any issues, please refer to the official documentation of the tools used in the Makefile to find platform-specific instructions.

## Input Instructions

Certain parts of the Makefile require user input or customization. Please review the Makefile comments and adjust the variables as needed before running the respective commands.

### How to Input Variables:
1. To find the absolute paths for given `static` files, use the findstatic target with the static variable:
   ```bash
   make findstatic static=path/to/static/file.css
2. To create a new Django app, use the `startapp` target with the newapp variable:
   ```bash
   make startapp newapp=newappname

**Other Targets**: For other Makefile targets that require additional input variables, review the comments in the Makefile and provide   the appropriate values for those variables.

**⚠️ Note**: Before running any commands, ensure you have Python 3.x installed, and you have cloned the repository and navigated to the project root

## Contributing

Contributions to this project are welcome! If you find a bug or have an enhancement in mind, please open an issue or submit a pull request.
 
## License

MIT License
