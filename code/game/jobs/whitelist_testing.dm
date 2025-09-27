//Database Whitelist Testing and Validation Guide
//This file provides testing procedures for the database whitelist system

/*
DATABASE WHITELIST SYSTEM TESTING GUIDE
=======================================

1. SETUP REQUIREMENTS:
   - MySQL database must be configured (dbconfig.txt)
   - SQL_ENABLED must be set in config.txt
   - USEWHITELIST must be uncommented in config.txt

2. TABLE CREATION TEST:
   - Start the server with database connection
   - Check that 'whitelist' table is created automatically
   - Verify table structure:
     * id (AUTO_INCREMENT PRIMARY KEY)
     * ckey (VARCHAR(32) NOT NULL, UNIQUE)
     * added_by (VARCHAR(32))
     * added_date (DATETIME DEFAULT CURRENT_TIMESTAMP)
     * active (BOOLEAN DEFAULT TRUE)
     * notes (TEXT)
     * Indexes: unique_ckey, idx_ckey_active, idx_active

3. MIGRATION TEST:
   a) Create test data in data/whitelist.txt:
      testuser1
      testuser2
      admin

   b) Use admin verb "Database Whitelist - Migrate from File"

   c) Verify database contains the migrated entries:
      SELECT * FROM whitelist WHERE active = 1;

   d) Check that notes field contains "Migrated from file-based whitelist"

4. ADMIN FUNCTIONALITY TEST:
   a) Test adding players:
      - Use "Database Whitelist - Add Player"
      - Try adding existing player (should update)
      - Try adding new player with notes

   b) Test removing players:
      - Use "Database Whitelist - Remove Player"
      - Verify player is marked as active = FALSE (not deleted)

   c) Test viewing whitelist:
      - Use "Database Whitelist - View Players"
      - Verify HTML table displays correctly
      - Check sorting and data accuracy

5. WHITELIST CHECKING TEST:
   a) Database mode (SQL enabled):
      - Add test user to database
      - Create test mob with that ckey
      - Call check_whitelist(mob) - should return 1
      - Remove user from database
      - Call check_whitelist(mob) - should return 0

   b) Fallback mode (SQL disabled):
      - Disable SQL or disconnect database
      - Add test user to data/whitelist.txt
      - Call check_whitelist(mob) - should return 1

6. BORDER CONTROL INTEGRATION TEST:
   a) Test database integration:
      - Use "Border Control - Whitelist Key (Database)"
      - Verify entry appears in database whitelist table

   b) Test migration:
      - Use "Border Control - Migrate to Database"
      - Verify border control entries are copied to database

7. JOB RESTRICTION TEST:
   a) Set USEWHITELIST in config
   b) Try to join as restricted job with whitelisted ckey - should succeed
   c) Try to join as restricted job with non-whitelisted ckey - should fail

8. PERFORMANCE TEST:
   a) Add 1000+ entries to database whitelist
   b) Measure check_database_whitelist() response time
   c) Test caching effectiveness with database_whitelist_loaded

9. FALLBACK BEHAVIOR TEST:
   a) Start with database enabled and working
   b) Disconnect database during runtime
   c) Verify system falls back to file-based checks
   d) Reconnect database and verify it resumes database mode

10. ERROR HANDLING TEST:
    a) Test with invalid database credentials
    b) Test with missing whitelist table
    c) Test with corrupted database connection
    d) Verify appropriate error messages and fallback behavior

EXPECTED BEHAVIOR:
- Database whitelist should be preferred when SQL is enabled
- File-based whitelist should be used as fallback
- Admin tools should work seamlessly
- Migration should preserve all data and add audit information
- System should be resilient to database failures

LOGGING VERIFICATION:
Check logs for these messages:
- "Loaded [X] entries from database whitelist."
- "Added [ckey] to database whitelist by [admin]"
- "Removed [ckey] from database whitelist by [admin]"
- "Whitelist migration completed: [X] successful, [Y] failed"
- "Database connection failed for whitelist. Using file-based system."

ADMIN VERBS TO TEST:
- Database Whitelist - Add Player
- Database Whitelist - Remove Player
- Database Whitelist - Migrate from File
- Database Whitelist - View Players
- Border Control - Whitelist Key (Database)
- Border Control - Remove Key (Database)
- Border Control - Migrate to Database
*/
