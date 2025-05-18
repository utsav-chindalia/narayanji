# Project Directory Structure

```
backend/api/
├── config/           # Configuration files (e.g., environment variables)
│   └── index.js
├── controllers/      # Route handler logic (controllers)
│   └── exampleController.js
├── routes/           # Route definitions and grouping
│   ├── example.js
│   └── index.js
├── services/         # Business logic and reusable service functions
│   └── exampleService.js
├── node_modules/     # Node.js dependencies
├── package.json      # Project metadata and dependencies
├── package-lock.json # Dependency lock file
├── server.js         # Express server entry point
```

## Folder & File Descriptions

- **config/**: Central place for configuration (e.g., loads environment variables).
- **controllers/**: Contains functions that handle incoming requests and responses.
- **routes/**: Defines API endpoints and connects them to controllers.
- **services/**: Contains business logic and reusable functions used by controllers.
- **server.js**: Main entry point for the Express server.
- **package.json / package-lock.json**: Node.js project files for dependencies and scripts.

---

This structure is designed for scalability and maintainability. Add new features by creating new controllers, services, and route files as needed. 