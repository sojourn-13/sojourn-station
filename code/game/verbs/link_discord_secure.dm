/client/var/discord_id

/client/verb/link_discord_secure()
	set name = "Link Discord to CKey"
	set category = "OOC"
	set desc = "Link your Discord account using a verification code from the Discord bot."

	if(!src || !ismob(src))
		return
	if(!usr.client)
		return

	var/verification_code = alert("Please enter the verification code from the Discord bot:", "Link Discord", "Enter Code", "Cancel")
	if(verification_code == "Cancel" || !verification_code)
		return

	// Get the actual code through a private input
	verification_code = input("Enter your 6-digit verification code:", "Discord Verification") as text|null
	if(!verification_code)
		return

	// Check if verification code exists and get Discord ID
	var/DBQuery/query = dbcon.NewQuery("SELECT discord_id FROM discord_verification WHERE ckey = '[usr.ckey]' AND code = '[verification_code]' AND expires > NOW()")
	if(!query.Execute())
		to_chat(src, "Database error occurred. Please contact an administrator.")
		return

	if(query.NextRow() == 0)
		to_chat(src, "Invalid or expired verification code.")
		return

	var/discord_id = query.item[1]

	// Check if Discord ID is already linked to another account
	query = dbcon.NewQuery("SELECT ckey FROM players WHERE discord_id = '[discord_id]'")
	if(!query.Execute())
		to_chat(src, "Database error occurred. Please contact an administrator.")
		return

	if(query.NextRow())
		var/existing_ckey = query.item[1]
		if(existing_ckey != usr.ckey)
			to_chat(src, "This Discord ID is already linked to another account.")
			return

	// Update the database with the Discord ID
	query = dbcon.NewQuery("UPDATE players SET discord_id = '[discord_id]' WHERE ckey = '[usr.ckey]'")
	if(!query.Execute())
		to_chat(src, "Failed to link Discord account. Please contact an administrator.")
		return

	// Clean up verification code
	query = dbcon.NewQuery("DELETE FROM discord_verification WHERE ckey = '[usr.ckey]' AND code = '[verification_code]'")
	query.Execute()

	// Store in client for this session
	usr.client.discord_id = discord_id
	to_chat(src, "Your Discord account has been linked successfully.")

	// Log the linking for admin records
	log_admin("[usr.ckey] linked Discord ID: [discord_id]")
