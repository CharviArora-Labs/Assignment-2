# Assignment-02 Command Catalogue

This document lists essential commands used during development, debugging,
cleanup, and validation of a Rails application.

---

## 1. Environment & System Commands

1. `ruby -v`  
   Verify installed Ruby version.

2. `rails -v`  
   Confirm Rails is installed.

3. `bundle -v`  
   Check Bundler version.

4. `which ruby`  
   Identify Ruby binary location.

5. `which rails`  
   Identify Rails binary location.

---

## 2. Project Setup & Dependency Management

6. `bundle install`  
   Install project dependencies.

7. `bundle update`  
   Update gems.

8. `bundle exec rails s`  
   Run Rails server with correct gem context.

9. `bundle exec rails c`  
   Open Rails console safely.

---

## 3. Rails Application Diagnostics

10. `rails server`  
    Start the Rails application.

11. `rails console`  
    Interactive Rails environment.

12. `rails runner 'puts "OK"'`  
    Validate Rails environment loading.

13. `rails routes`  
    Quickly verify application routes.

14. `rails db:version`  
    Check database connectivity and migration state.

15. `rails db:migrate:status`  
    Inspect migration health.

---

## 4. Database Management

16. `rails db:create`  
    Create local databases.

17. `rails db:migrate`  
    Apply migrations.


---

## 5. File System & Cleanup Commands

18. `rm -rf app/tmp/*`  
    Remove temporary runtime artifacts (safe).

19. `rm -f app/log/*.log`  
    Clear log files.

20. `find . -name ".DS_Store" -delete`  
    Remove OS-generated clutter.

21. `ls -la`  
    Inspect directory contents.

22. `pwd`  
    Confirm current working directory.

---

## 6. Script Execution & Permissions

23. `bash scripts/dev-status.sh`  
    Run development status checks.

24. `bash scripts/clean-safe.sh`  
    Run safe cleanup utility.

25. `chmod +x scripts/*.sh`  
    Make scripts executable.

---

## Safety Notes

- No command deletes databases or credentials.
- Cleanup scripts intentionally avoid `db/`, `config/`, and `app/models`.
- All destructive commands are scoped and reversible.

