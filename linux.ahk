#Requires AutoHotkey v2.0
#SingleInstance force

::isudo::sudo su - ubuntu

::igrep::
{ 
	Send("grep -is '' *")
	Send("{left 3}")
	return
}  

::mgrep::
{ 
	Send("grep -is -A 2 -B 2 '' *")
	Send("{left 3}")
	return
}  

::lt::
{ 
	Send("ll -rth **")
	Send("{left 1}")
	return 
}  
 
::vig::
{ 
	Send("vi ``grep -lis '' *``")
	Send("{left 4}")
	return
}  

::vil::
{ 
	Send("vi ``ls -rt **``")
	Send("{left 2}")
	return
}

