**--- still under development---**

Smartfren, I Hit You
--------------
two absurd college stu talk about their daily absurb stuff

* **barock19** 	: 	are you one of smartfern customer ? 
* **ojankill** 	: 	yup !!,
* **barock19** 	: 	hmm … what plan did you always mostly subscribe on smartfren connex? daily, weekly, mothnly ?
* **ojankill** 	: 	dude.. don't you see, i am a college stu. i have no money about subscribe for a week moreover for a month, i prefer to buy a pack of **"Djarum"**, or took my new GF to cinema.
* **barock19**	: 	ciyuss.. miapa ???
* **ojankill**	: 	MIYABI !!!!
* **both** 	: 		HUahahauhaahahauhaha …
* **barock19**	: 	ok.., have you got in trap by smartfren ?
* **ojankill**	: 	like ??
* **barock19**	: 	currently you are in active packet of daily connex, and you have current balance that you have prepare for next subscription, but you forgot to reregister , and your active packet just expired when you're browsing or in ssh session to server, till you got warning *"write failed: Broken pipe"*, and than you realize that you just forgot to reregister and your balance just nil .
* **ojankill** 	:	FTW !!!, you pissed me off dude !!, it's almost happen everyday.. DAMN!! , why you ask about it to me , Hah ??
* **barock19**	: 	Hahaha.. sellowwww ..coy, i just made a solution for this F--Kin thing. i call it,  **Smartfren , *I Hit You*.**
* **ojankill** 	: 	Weeeww.. what's that?
* **barock**	: 	it just kinda simple Rake app build on Rails, to make you able to running clock deamon, to keep you never be late to register your subscription on Smartfren , it'll reregister for you.
* **ojankill**	: 	DAMN …, how nobel you are, it will save a lot of poor college stu. like us.
* **barock19**	: 	Yup .. !!
* **ojankill**	: 	and, how we can use this stuff?
* **barock19**	: 	just read the doc bellow , you little b--t--rd
* **ojankill**	: 	Hahaha.. sellowwww ..coy
* **barock19**	: 	BTW, who is ur new GF? i never heard you ever shoot any girl ..
* **ojankill**	: 	F--K you !!!
* **barock19**	: 	Uppss ..


to be continued ..

note : *the documentation bellow, assume that you already and familiar with git and heroku.*
***

clone this repo , and deploy to heroku.

	git clone git@github.com:barock19/smartfren-i-hit-you.git
	cd smartfren-i-hit-you
	#create an app on heroku , and automatically it'll add remote named heroku to this git
	heroku create
	#push it to heroku master branch
	git push heroku master
	#load
	heroku run 'rake db:migrate'

by default heroku scale our app with one web process. but this app have no web process, it's only have one clock process, so .., we need scale this app's process model with heroku "ps" command,

	heroku ps:scale web=0 clock=1

but , if you got warning like this

	Scaling clock processes... failed
	 !    Please verify your account in order to change resources
	 !    For more information, see http://devcenter.heroku.com/categories/billing
	 !    Verify now at http://heroku.com/verify
	 
heroku successfully detect us as a poor guy (WTF!!), because heroku detect that we'll add two process model and will be assign for two different dyno, even we scale it for 0 dynos. heroku only give 750 free dyno-hours per month each app for user whose never added their Credit Card to Heroku, so, heroku need us to verify it. 

* **barock19** : do you have money, or CC ??
* **ojankill**	: ….
* **barock19**	: Ok.., i got the answer.

to pass this scaling process, all we have to do is just do it smoothly. just run "ps" command twice. like so.
	
	#assume you still in the repo dir(smartfren-i-hit-you)
	heroku ps:scale web=0
	heroku ps:scale clock=1

and than. we just pass the scalling process .. :), what next

start add your number and password which you use to login in http://data.smartfren.com
	
	#assume you still in the repo dir(smartfren-i-hit-you)
	heroku run 'rake sihu:daftar_nomer [nomor] [passwor]'

ok. this app will start do clock demon, and check your current package status on data.smartfren.com




