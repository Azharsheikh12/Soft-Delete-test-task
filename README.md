#Rails Soft Delete Application

**Overview**
This Ruby on Rails application implements soft delete functionality, allowing records to be marked as deleted without being permanently removed from the database. Instead of deletion, the deleted_at column in the Item model is set to a timestamp, ensuring data integrity and the ability to restore records when needed.

Features
✅ Soft Delete – Instead of permanently deleting a record, the system sets the deleted_at column to the current timestamp.
✅ Restore Functionality – Soft-deleted records can be restored with a single click, resetting deleted_at to nil.
✅ Default Scope for Active Records – By default, only records where deleted_at is nil are included in queries.
✅ User Interface Support – Deleted records remain visible in the UI and can be restored via an intuitive interface.

Project Snapshots
Screenshots of the application can be found in the public/project-image folder.

Example:

Installation & Setup
1️⃣ Clone the Repository

bash
Copy
Edit
git clone https://github.com/Azharsheikh12/Soft-Delete-test-task.git
cd YOUR_REPO_NAME
2️⃣ Install Dependencies

bash
Copy
Edit
bundle install
3️⃣ Set Up the Database

bash
Copy
Edit
rake db:create db:migrate
4️⃣ Precompile Assets (Required for production or if assets are missing)

bash
Copy
Edit
rails assets:precompile
5️⃣ Start the Rails Server

bash
Copy
Edit
rails s
6️⃣ Access the Application
Visit http://localhost:3000 in your browser to access the UI.

Usage Instructions
Deleting a Record: Click the Delete button on a record to soft delete it.

Viewing Deleted Records: Deleted records will remain visible but flagged as deleted.

Restoring a Record: Click the Restore button to bring back a deleted record.