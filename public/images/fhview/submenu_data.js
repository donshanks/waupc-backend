_menuCloseDelay=500           // The time delay for menus to remain visible on mouse out
_menuOpenDelay=150            // The time delay before menus open on mouse over
_subOffsetTop=10              // Sub menu top offset
_subOffsetLeft=-5            // Sub menu left offset
_sidetop=200;
with(subStyle2=new mm_style()){
  bordercolor="#ffffff";
  borderstyle="solid";
  borderwidth=1;
  fontfamily="arial, tahoma";
  fontsize="68%";
  fontstyle="normal";
  headerbgcolor="#AFD1B5";
  headerborder=1;
  headercolor="#000099";
  imagepadding=3;
  offbgcolor="#B6B6B6";
  offcolor="#ffffff";
  onbgcolor="#2A6ACC";
  oncolor="#f0f0f0";
  onsubimage="/images/fhview/onarrow.gif";
  padding=1;
  pagecolor="#f0f0f0";
  pagebgcolor="#17335E";
  pageimage="/images/fhview/onimage.gif";
  separatorcolor="#ffffff";
  separatorsize="1";
  separatorheight="1";
  subimage="/images/fhview/offarrow.gif";
  valign="middle";
  menubgcolor="#F5F5F5";
}
with(mainStyle2=new mm_style()){
  fontfamily="arial, verdana";
  fontsize="18";
  fontstyle="normal";
  headerbgcolor="transparent";
  headerborder=1;
  headercolor="transparent";
  imagepadding=3;
  offbgcolor="transparent";
  offcolor="#233C6F";
  onbgcolor="transparent";
  oncolor="#2A6ACC";
  outfilter="randomdissolve(duration=0.2)";
  padding=1;
  pagebgcolor="transparent";
  pagecolor="#2A6ACC";
  separatoralign="right";
  separatorcolor="transparent";
  separatorpadding=1;
  separatorwidth="2";
  valign="middle";
  menubgcolor="transparent";
}
with(milonic=new menuname("nav1")){
  style=subStyle2;
  margin=3;
  aI("text=Who We Are;url=http://www.waupc.com/who.php;");
  aI("text=Ministers;url=http://www.waupc.com/ministers.php;");
  aI("text=Officials;url=http://www.waupc.com/officials.php;showmenu=nav6;");
}
with(milonic=new menuname("nav6")){
  style=subStyle2;
  margin=3;
  overflow="scroll";
  aI("text=District Officials;url=http://www.waupc.com/officials.php;");
  aI("text=Presbyters;url=http://www.waupc.com/presbyters.php;");
}
with(milonic=new menuname("nav2")){
  style=subStyle2;
  margin=3;
  aI("text=Apostolic Man;url=http://www.waupc.com/apostolic_man.php;");
  aI("text=Foreign Missions;url=http://www.waupc.com/foreign_missions.php;");
  aI("text=Home Missions;url=http://www.waupc.com/home_missions.php;");
  aI("text=Ladies Ministries;url=http://www.waupc.com/ladies_ministries.php;");
  aI("text=Media Missions;url=http://www.waupc.com/media_missions.php;");
  aI("text=Sunday School;url=http://www.waupc.com/sunday_school.php;");
  aI("text=Youth Ministries;url=http://www.waupc.com/youth_ministries.php;");
}
with(milonic=new menuname("nav3")){
  style=subStyle2;
  margin=3;
  aI("text=Calendar;url=http://www.waupc.com/calendar.php;");
  aI("text=News;url=http://www.waupc.com/news.php;");
  aI("text=Events;url=http://www.waupc.com/events.php;");
}
with(milonic=new menuname("nav4")){
  style=subStyle2;
  margin=3;
  aI("text=Section One;url=http://www.waupc.com/section_one.php;");
  aI("text=Section Two;url=http://www.waupc.com/section_two.php;");
  aI("text=Section Three;url=http://www.waupc.com/section_three.php;");
  aI("text=Section Four;url=http://www.waupc.com/section_four.php;");
  aI("text=Section Five;url=http://www.waupc.com/section_five.php;");
}
with(milonic=new menuname("nav5")){
  style=subStyle2;
  margin=3;
  aI("text=Churches in Washington;url=http://www.waupc.com/churches.php;");
  aI("text=Churches Outside Washington;url=http://wec.wupc.org/churches;");
}
with(milonic=new menuname("MainMenu")){
  style=mainStyle2;
  top=250;
  left=10;
  alwaysvisible=1;
  orientation="vertical";
  position="relative";
  itemheight=20;
  margin=2;
  aI("text=Home;url=http://www.waupc.com/index.php;");
  aI("text=About Us;url=http://www.waupc.com/about.php;showmenu=nav1;");
  aI("text=Ministries;showmenu=nav2;");
  aI("text=Calendar;url=http://www.waupc.com/calendar.php;showmenu=nav3;");
  aI("text=Sections;showmenu=nav4;");
  aI("text=Churches;url=http://www.waupc.com/churches.php;showmenu=nav5;");
  aI("text=Ministers Area;url=http://www.waupc.com/ministers_area.php;");
  aI("text=Endowment;url=http://www.waupc.com/endowment.php;");
  aI("text=Contact Us;url=http://www.waupc.com/contact.php;");
}
drawMenus();
