/obj/structure/closet/secure_closet/reinforced/captains
	name = "premier's locker"
	req_access = list(access_captain)
	icon_state = "cap"

/obj/structure/closet/secure_closet/reinforced/captains/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/storage/backpack/captain(src)
	new /obj/item/storage/backpack/satchel/captain(src)
	new /obj/item/clothing/under/rank/captain(src)
	new /obj/item/clothing/accessory/halfcape/premier(src)
	new /obj/item/clothing/suit/armor/vest(src)
	new /obj/item/clothing/head/helmet(src)
	new /obj/item/clothing/shoes/color/brown(src)
	new /obj/item/device/radio/headset/heads/captain(src)
	new /obj/item/clothing/gloves/captain(src)
	new /obj/item/device/flash(src)
	new /obj/item/gun/projectile/basilisk(src)
	new /obj/item/ammo_magazine/kurz_50/rubber(src)
	new /obj/item/ammo_magazine/kurz_50/rubber(src)
	new /obj/item/ammo_magazine/kurz_50/rubber(src)
	new /obj/item/ammo_magazine/kurz_50/rubber(src)
	new /obj/item/storage/pouch/baton_holster/telebaton(src)
	new /obj/item/storage/pouch/pistol_holster(src)

/obj/structure/closet/secure_closet/reinforced/hop
	name = "Steward's locker"
	req_access = list(access_hop)
	icon_state = "hop"

/obj/structure/closet/secure_closet/reinforced/hop/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/clothing/glasses/sunglasses(src)
	new /obj/item/clothing/under/rank/first_officer(src)
	new /obj/item/clothing/head/rank/first_officer(src)
	new /obj/item/clothing/suit/armor/vest(src)
	new /obj/item/clothing/head/helmet(src)
	new /obj/item/device/radio/headset/heads/hop(src)
	new /obj/item/gun/projectile/colt/ten(src)
	new /obj/item/ammo_magazine/magnum_40/rubber(src)
	new /obj/item/ammo_magazine/magnum_40/rubber(src)
	new /obj/item/ammo_magazine/magnum_40/rubber(src)
	new /obj/item/ammo_magazine/magnum_40/rubber(src)
	new /obj/item/device/flash(src)
	new /obj/item/storage/pouch/pistol_holster(src)

/obj/structure/closet/secure_closet/reinforced/hos
	name = "warrant officer's locker"
	req_access = list(access_hos)
	icon_state = "hos"

/obj/structure/closet/secure_closet/reinforced/hos/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/device/t_scanner/advanced(src)
	new /obj/item/clothing/head/rank/commander(src)
	new /obj/item/clothing/mask/gas/ihs(src)
	new /obj/item/clothing/suit/armor/hos(src)
	new /obj/item/clothing/suit/armor/platecarrier/hos(src)
	new /obj/item/clothing/under/rank/ih_commander(src)
	new /obj/item/clothing/accessory/halfcape/wo(src)
	new /obj/item/clothing/glasses/sechud(src)
	new /obj/item/gun_upgrade/trigger/dnalock(src)
	new /obj/item/storage/pouch/pistol_holster(src)
	new /obj/item/storage/pouch/baton_holster/telebaton(src)
	new /obj/item/storage/box/trackimp(src)
	new /obj/item/storage/belt/security/tactical(src)
	new /obj/item/storage/belt/webbing/ih(src)
	new /obj/item/device/radio/headset/heads/hos(src)
	new /obj/item/device/holowarrant(src)
	new /obj/item/taperoll/police(src)
	new /obj/item/gunbox/warrantofficer(src) // Primary on their locker, secondary on their hardcase.
	new /obj/item/clothing/gloves/stungloves(src)
	new /obj/item/device/taperecorder(src)
	new /obj/item/clipboard(src)
	new /obj/item/device/camera(src)
	new /obj/item/melee/classic_baton(src)
	new /obj/item/oddity/code_book(src)
	new /obj/item/clothing/head/helmet/warrant_officer(src)
	new /obj/item/storage/sheath/judgement/filled(src)
	new /obj/item/device/radio/headset/heads/hos(src)

/obj/structure/closet/secure_closet/warden
	name = "supply specialist's locker"
	req_access = list(access_armory)
	icon_state = "warden"

/obj/structure/closet/secure_closet/warden/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/device/bullet_scanner(src)
	new /obj/item/gun_upgrade/trigger/dnalock(src)
	new /obj/item/device/holowarrant(src)
	new /obj/item/clothing/under/rank/warden(src)
	new /obj/item/clothing/head/rank/warden/beret(src)
	new /obj/item/pc_part/drive/disk/design/exotic_ammo(src)
	new /obj/item/pc_part/drive/disk/design/security/marshal_ammo(src)
	new /obj/item/pc_part/drive/disk/design/gun_frames/marshal/surplus(src)
	new /obj/item/device/radio/headset/headset_sec/bowman(src)
	new /obj/item/device/radio/headset/headset_sec(src)
	new /obj/item/clothing/glasses/sechud/tactical(src)
	new /obj/item/clothing/glasses/sechud(src)
	new /obj/item/clothing/mask/gas/ihs(src)
	new /obj/item/storage/belt/security(src)
	new /obj/item/storage/box/teargas(src)
	new /obj/item/storage/box/flashbangs(src)
	new /obj/item/storage/belt/webbing/ih(src)
	new /obj/item/storage/box/holobadge(src)
	new /obj/item/storage/pouch/pistol_holster(src)
	new /obj/item/device/taperecorder(src)
	new /obj/item/clipboard(src)
	new /obj/item/device/camera(src)
	new /obj/item/clothing/suit/storage/armor/marshal_coat_ss(src)
	new /obj/item/storage/box/trackimp(src)
	new /obj/item/oddity/code_book(src)
	new /obj/item/device/t_scanner/advanced(src)
	new /obj/item/clothing/head/helmet/marshal_full(src)
	new /obj/item/voucher/marshal/specprimary(src)
	new /obj/item/voucher/marshal/secondary(src)
	new /obj/item/voucher/marshal/armor(src)

/obj/structure/closet/secure_closet/personal/security
	name = "marshal officer's locker"
	req_access = list(access_hos)
	access_occupy = list(access_brig)
	icon_state = "sec"

/obj/structure/closet/secure_closet/personal/security/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/storage/backpack/ironhammer(src)
	if(prob(50))
		new /obj/item/storage/backpack/ironhammer(src)
	else
		new /obj/item/storage/backpack/sport/ironhammer(src)
	new /obj/item/voucher/marshal/primary(src)
	new /obj/item/voucher/marshal/secondary(src)
	new /obj/item/voucher/marshal/armor(src)
	new /obj/item/storage/backpack/satchel/ironhammer(src)
	new /obj/item/device/radio/headset/headset_sec(src)
	new /obj/item/storage/belt/security(src)
	new /obj/item/gun_upgrade/trigger/dnalock(src)
	new /obj/item/device/holowarrant(src)
	new /obj/item/clothing/mask/gas/ihs(src)
	new /obj/item/clothing/glasses/sechud(src)
	new /obj/item/storage/pouch/pistol_holster(src)
	new /obj/item/clothing/accessory/holster/waist(src)
	new /obj/item/storage/pouch/baton_holster(src)
	new /obj/item/taperoll/police(src)
	new /obj/item/device/taperecorder(src)
	new /obj/item/clipboard(src)
	new /obj/item/device/camera(src)
	new /obj/item/device/t_scanner/advanced(src)

/obj/structure/closet/secure_closet/personal/detective
	name = "ranger's locker"
	req_access = list(access_hos)
	access_occupy = list(access_forensics_lockers) //So we can claim
	icon_state = "cabinetdetective"

/obj/structure/closet/secure_closet/personal/detective/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/clothing/under/rank/inspector(src)
	new /obj/item/clothing/mask/gas/ihs(src)
	new /obj/item/clothing/gloves/thick(src)
	new /obj/item/clothing/head/rank/inspector(src)
	new /obj/item/gun_upgrade/trigger/dnalock(src)
	new /obj/item/clothing/shoes/reinforced(src)
	new /obj/item/storage/box/evidence(src)
	new /obj/item/device/radio/headset/headset_sec(src)
	new /obj/item/storage/belt/security(src)
	new /obj/item/device/holowarrant(src)
	new /obj/item/clothing/glasses/sechud/tactical(src)
	new /obj/item/clothing/glasses/sechud(src)
	new /obj/item/taperoll/police(src)
	new /obj/item/device/taperecorder(src)
	new /obj/item/clipboard(src)
	new /obj/item/device/camera(src)
	new /obj/item/storage/pouch/pistol_holster/cowboy(src) // More thematic
	new /obj/item/implantpad(src)
	new /obj/item/device/t_scanner/advanced(src)
	new /obj/item/voucher/marshal/rangerprimary(src)
	new /obj/item/voucher/marshal/rangersecondary(src)
	new /obj/item/voucher/marshal/armor(src)

/obj/structure/closet/secure_closet/injection
	name = "lethal injections locker"
	req_access = list(access_captain)
	icon_state = "secure"

/obj/structure/closet/secure_closet/injection/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/reagent_containers/syringe/ld50_syringe/choral(src)
	new /obj/item/reagent_containers/syringe/ld50_syringe/choral(src)

/obj/structure/closet/secure_closet/brig
	name = "brig locker"
	req_access = list(access_brig)
	anchored = 1
	icon_state = "secure"
	var/id

/obj/structure/closet/secure_closet/brig/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/clothing/under/orange(src)
	new /obj/item/clothing/shoes/orange(src)

/obj/structure/closet/secure_closet/courtroom
	name = "courtroom locker"
	req_access = list(access_security)
	icon_state = "sec"

/obj/structure/closet/secure_closet/courtroom/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/clothing/shoes/color/brown(src)
	new /obj/item/paper/court(src)
	new /obj/item/paper/court(src)
	new /obj/item/paper/court(src)
	new /obj/item/pen(src)
	new /obj/item/clothing/suit/costume/job/judge(src)
	new /obj/item/clothing/head/costume/history/powdered(src)
	new /obj/item/storage/briefcase(src)

/obj/structure/closet/secure_closet/armory_explosive
	name = "high explosive grenades locker"
	req_access = list(access_security)
	icon_state = "sec"

/obj/structure/closet/secure_closet/armory_explosive/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/storage/box/blast_grenade_shells(src)
	new /obj/item/storage/box/blast_grenade_shells(src)
	new /obj/item/storage/box/blast_grenade_shells(src)
	new /obj/item/storage/box/frag_grenade_shells(src)
	new /obj/item/storage/box/frag_grenade_shells(src)
	new /obj/item/storage/box/frag_grenade_shells(src)

/obj/structure/closet/secure_closet/armory_ltl_emp
	name = "LTL / EMP grenades locker"
	req_access = list(access_security)
	icon_state = "sec"

/obj/structure/closet/secure_closet/armory_ltl_emp/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/storage/box/baton_rounds(src)
	new /obj/item/storage/box/baton_rounds(src)
	new /obj/item/storage/box/anti_photons(src)
	new /obj/item/storage/box/anti_photons(src)
	new /obj/item/storage/box/emp_grenade_shells(src)
	new /obj/item/storage/box/emp_grenade_shells(src)

/obj/structure/closet/secure_closet/armory_ltl_shotgun
	name = "LTL shotgun ammunition locker"
	req_access = list(access_security)
	icon_state = "sec"

/obj/structure/closet/secure_closet/armory_ltl_shotgun/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/ammo_magazine/ammobox/shotgun/beanbags(src)
	new /obj/item/ammo_magazine/ammobox/shotgun/beanbags(src)
	new /obj/item/ammo_magazine/ammobox/shotgun/flashshells(src)
	new /obj/item/ammo_magazine/ammobox/shotgun/flash(src)
	new /obj/item/ammo_magazine/ammobox/shotgun/stunshells(src)

/obj/structure/closet/crate/secure/weapon/amr
	name = "antimateriel rifle crate"
	desc = "A secure weapons crate."
	icon_state = "weaponcrate"

/obj/structure/closet/crate/secure/weapon/amr/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/storage/box/syndie_kit/antimateriel_rifle(src)
