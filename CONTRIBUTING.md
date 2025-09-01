# Contributing to Salmo <!-- omit in toc -->

Thank you for your interest in contributing to Salmo! This document provides guidelines and information for contributors.

- [Managing the Project](#managing-the-project)
- [Preparing the Environment](#preparing-the-environment)
  - [Preparing the Basic Environment](#preparing-the-basic-environment)
  - [Preparing the Local Repository](#preparing-the-local-repository)
- [Contributing](#contributing)
  - [Committing](#committing)
  - [Pushing to the Repositories](#pushing-to-the-repositories)
  - [Creating Pull Requests](#creating-pull-requests)
  - [Submitting a Pull Request](#submitting-a-pull-request)
- [Developing](#developing)
  - [Running the Development Environment](#running-the-development-environment)
  - [Writing Code](#writing-code)
  - [Checking Code Quality](#checking-code-quality)
  - [Building](#building)
- [Getting Help](#getting-help)
  - [Getting Asynchronous Help](#getting-asynchronous-help)
  - [Getting Real-Time Help](#getting-real-time-help)
- [License](#license)

## Managing the Project

// TODO: add info about the project management

## Preparing the Environment

### Preparing the Basic Environment

Install the following tools:

- [Git](https://git-scm.com/downloads)
- [Bash](https://www.gnu.org/software/bash/) (should be available on most Unix-like systems)
- [Bashly](https://bashly.dannyb.co/) (for CLI development)

### Preparing the Local Repository

1. **Clone the repository**

   Clone the repository to your local machine:

   ```sh
   git clone https://github.com/luisfuturist/de/salmo.git
   cd salmo/
   ```

2. **Install Bashly (if not already installed)**

   ```bash
   gem install bashly
   ```

## Contributing

### Committing

1. **Generate a commit message**
   - Use the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) format
   - It's recommended to generate a commit message using AI of the IDE you are using
   - Check for warnings of already included authors in the commit message

2. **Commit**
   - Run `git commit` to commit your changes or use the IDE's commit button

### Pushing to the Repositories

You can use the following command to push your changes to the repository:

```bash
git push --set-upstream origin main # or `git push` if you have already set up upstream
```

### Creating Pull Requests

- Provide a clear description of the changes
- Include any relevant issue numbers
- Ensure all tests pass and code quality checks are satisfied
- Update documentation if necessary

### Submitting a Pull Request

1. **Create a branch**:
   ```bash
   git checkout -b feat/your-feature-name # or fix/your-fix-name, chore/your-chore-name, docs/your-docs-name, etc.
   ```

2. **Make your changes** following the guidelines

3. **Test your changes** by running the application

4. **Check code quality (if applicable)**:
   ```bash
   # Generate and test the CLI
   bashly generate
   ```

5. **Commit your changes**. See [Committing](#committing) for more information.

6. **Push and create a pull request**. See [Pushing to the Repositories](#pushing-to-the-repositories) and [Creating Pull Requests](#creating-pull-requests) for more information.

## Developing

### Running the Development Environment

1. **Start the development environment**
   - To start the development environment with auto-reload, run:
     ```bash
     cd src/scripts/salmo
     bashly generate --watch

     cd src/scripts/salmox
     bashly generate --watch
     ```

2. **Test the CLI tools**
   - Test the Salmo CLI:
     ```bash
     ./src/scripts/salmo/salmo --help
     ```
   - Test the Salmox CLI:
     ```bash
     ./src/scripts/salmox/salmox --help
     ```

### Writing Code

- Use meaningful variable and function names
- Avoid redundant comments with the code itself
- Keep functions small and focused
- Follow Bash best practices
- Use proper error handling

### Checking Code Quality

For keeping the code organized, we use the following tools:

- [Bashly](https://bashly.dannyb.co/): Used to generate and validate CLI structure
- [ShellCheck](https://www.shellcheck.net/): For shell script linting and best practices (recommended)

### Building

To build the CLI tools, run:

```bash
cd src/scripts/salmo
bashly generate

cd src/scripts/salmox
bashly generate
```

This will generate the final CLI executables in the respective script directories.

## Getting Help

> [!WARNING]
> For human-human communication, please prioritize asynchronous communication over real-time communication when possible.

### Getting Asynchronous Help

If you have questions or need help, we recommend you to follow these steps in order:

1. Read through this contributing guide.
2. Check the existing documentation in the project.
3. Refer to the official documentation for any relevant technologies.
4. Examine existing code, issues, and discussions for similar problems.
5. If you still need help, open a new issue for bugs or feature requests, or use a discussion for general questions.

### Getting Real-Time Help

For immediate assistance, we encourage you to use both community support and AI.

* **Community**: Check if there's a community channel or forum for the project.
* **AI Assistants:** We encourage you to leverage general-purpose AI Assistant, such as [Gemini](https://gemini.google.com/) or [ChatGPT](https://chatgpt.com/). They provide high-level, conversational help, such as explaining complex concepts, brainstorming solutions, and more.

## License

By contributing to this project, you agree that your contributions will be licensed under the same license as the project.

---

Thank you for contributing to Salmo!
