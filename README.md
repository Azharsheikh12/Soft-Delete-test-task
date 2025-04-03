# Rails Soft Delete Application

## Overview
A Ruby on Rails implementation of soft delete functionality using `deleted_at` timestamps to preserve data while supporting deletion workflows.

## Features
- 🗑️ **Soft Delete**: Records are marked deleted instead of being destroyed
- 🔄 **Restore**: One-click restoration of deleted items
- 🔍 **Default Scoping**: Automatically filters out deleted records
- 👁️ **Visibility**: Deleted records remain visible with clear indicators

## Installation & Setup

### 1. Clone and Enter Directory

git clone https://github.com/Azharsheikh12/Soft-Delete-test-task.git
cd Soft-Delete-test-task

### 2. Install Dependencies

bundle install


### 3. Setup Database

rails db:create db:migrate


### 4. Precompile Assets (If Needed)

rails assets:precompile


### 5. Start the Server

rails server # or shorthand: rails s

### 6. Access Application

Visit in your browser:
http://localhost:3000