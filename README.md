# README


**Overview**

This Rails application demonstrates the implementation of a soft delete functionality, where records are marked as deleted without being physically removed from the database. The deleted_at column in the Item model is used to determine whether a record is active or soft-deleted.

Features:
Soft Delete: Records can be marked as deleted by setting the deleted_at column to the current timestamp.
Restore: Soft-deleted records can be restored by resetting the deleted_at column to nil.
Default Scope: Active records (where deleted_at is nil) are included in queries by default.

Additional: 

Restore functionality: After the record are marked deleted they will be visible and can be restored with single click on UI


Steps to run file:

unzip project file go to root directory 

1. bundle install

2. rake db:create db:migrate

3. rails assets:precompile

4. rails s 

visit localhost:3000 for project UI