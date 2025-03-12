# Code of Conduct

## Important
The Equinox Github follows the same rules listed on our Discord / Wiki that is applicable to our server, especially Rule 0 and Rule 1.


## PR Discussion
Comments on all PRs must remain relevant to the PR in question and not derail discussions.

Users should not be attacked for their ideas or contributions, constructive criticism is encourage and toxicity or general mean-spirited behaviour will not be tolerated. All participants are expected to be civil.

Nagging for merge, opinions-shopping (Especially DM shopping for contradicting opinions) are not tolerated behaviors. Repeated behavior of this nature will result in warnings or an outright ban from the repository.

If you are exhibiting behaviors negative to the community - including repeat violations of the above rules, personal attacks etc., you can be banned from not just the Github but also other services provided by the Equinox server.

The development team may collectively vote to revoke access from the repository if your behavior is considered to be a net negative, and it is enforceable once a majority of all currently active developers (Having contributed code / reviewed / discussed design matters in the last 2 months) agree on doing so. This policy may change if a Head Developer is appoined again.

## PR Approval / Objection & Merging
Developers may merge in PR that has been approved by another developer other than themselves. It is expected that the code is reviewed to a reasonable extent before an approval is given.

There is no minimal waiting period, but developers are expected to use discretions based on how controversial the PR is and how big of an impact it is.

Self Merge is discouraged and is only to be done when something is truly, actually urgent or somehow the entire development team is inactive.

Development team members are expected to provide their reasons for objecting or approving a pull request, proportional to the amount of efforts and changes in the request (A fix / small QOL can be simply approved without a word).

PRs can be closed by developers at their discretion should for one or more of the above reason:
 - Your total PR history is focused solely on balance / feature, especially on a department you play
- You have very little to no playtime on the server
- You are taking on, or starting PRs that are disproportional to the amount of coding skills / game design skills you have.

## Testmerges
Testmerges can be started by anyone with a developer permission, and should be used for PRs that
- Bring in a feature that requires more extensive testing from the community
- May or may not be controversial and could be reverted at some point

And other appropriate PRs as decided by the developer.

Testmerges should NOT be used for PRs that touches character setup or preferences in an irreversible way. They are to be tested thoroughly and merged in / rejected as needed.

## PR Expectations
All PRs are expected to be tested prior to submission to a reasonable extent. If it fails to pass CI check, it is unlikely to be merged without sufficient explanation. Constantly not testing codes to ensure it is functional may result in a unilateral closure of PRs or a git ban. We all make mistakes and add bugs - but we expect a basic degree of competency.

If possible, do not use the Github Web Editor. Excessive usage for PR that should've been tested locally may result in it being unilaterally closed.

## PR Policies by Types
Before making any kind of **Major Feature / Design PR**, please ensure you have sufficient support from the Lore / Developer Team and agreement on the content you are adding before coding in the PR. We respect everyone's efforts to contribute to the codebase, but expended efforts is not a reason in of itself to accept a PR regardless of its content. If you are unsure, discuss in the Discord and gain support before doing so.

Knee jerk nerf / buff PR and revert PRs are heavily discouraged and can be ground for a git ban.

Here's our PR policies by types:
- **Bugfixes:** Are always welcome and can be merged quickly if it has no balance implications (beyond fixing the bug).
- **Tweaks / Rebalance:** Please exercise discretions.
- **Large scale refactors:** Especially those that touch a lot of paths and or disrupt pathing work - please consul the relevant person as they can be rejected if it interferes with more important, pending PR
- **Gun, Armor, Mobs:** With exception of fixes, bugfixes, any PRs that has to do with the pending Gun, Armor & Mobs Rework as we transition to our own settings must seek approval from the relevant people responsible for overseeing these reworks. New Contents should also go through them.
- **Mapping PR:** The current Sojourn map is not the final map and we'll not be accepting large mapping PR targeted at it. For contribution to the new map, please consult the mapping team.
- **Fluff Items:** We are no longer accepting fluff items meant exclusively for one player. If you submit a PR for fluff item, it must be widely accessible and there should be sufficient demand in the community that it is likely to be used by someone other than yourself.

More will be added as policies develop.

### Upstream Syncing / Pulling
Equinox was originally forked off the Sojourn-Station Codebase as of July 2024. Sojourn is originally based on CEV-Eris codebase and as of 3/6/2025 (The time paragraph was written), most of the playerbase come from the previous Occulus-Eris codebase, based on an older fork of CEV-Eris.

But we're our own codebase, so when it comes to porting / syncing contents, you are allowed to consolidate several PRs of the same types into one PR to make it easier, but keep in mind the following:
- Bugfixes are always welcome and can be batched together as long as it doesn't become cumbersome to review (Please coordinate with developers who are working on this to avoid overlapping work)
- Features work from related servers should be reviewed and appropriate for the server's setting and playsyle
- Balance changes meant to deal with the particular circumstances of another server can be unilaterally rejected, if it is not sufficiently explained why it is applicable to our server
- PRs / Features that has been approved for Occulus-Eris codebase and fit in with the new codebase will be approved more easily.

## Issues
The issues section of the Github is for reporting actual bugs. Only staffs on the development team may use it as a feature tracker (In the future, it might be moved to Projects). It is considered a bug / issue if:
1. The feature is clearly not working as the designer / PR maker intends
2. It is an exploit that would trivialize a part of the game completely

For typos, especially typos within the code itself which are unfortunately extremely common, please do not open an issue or individual issue per typo - just fix it with a PR!
