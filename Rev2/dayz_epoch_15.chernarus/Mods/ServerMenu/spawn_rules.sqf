// Displays server rules

// WARNING!! If you want to change the amount of rules you have to know what you are doing.

_rule1 = format["RESPECT ADMINS AT ALL TIMES"];
_rule1sub = format["Admins are here to help you. Please respect their time."];
_rule2 = format["NO KILLING WITHIN 500M OF A SAFEZONE"];
_rule2sub = format["Ignoring this rule will end up with a ban."];
_rule3 = format["NO STEALING IN SAFEZONES"];
_rule3sub = format["If it isn't yours, dont touch it."];
_rule4 = format["NO CAMPING OF SAFEZONES"];
_rule4sub = format["This means waiting at a safezoned area, or within 1KM of one."];
_rule5 = format["NO BUILDING WITHIN 1KM OF TRADERS"];
_rule5sub = format["Bases found within this WILL BE DELETED."];
_rule6 = format["NO BUILDING WITHIN 1KM OF HIGH LOOT VALUE BUILDINGS"];
_rule6sub = format["Barracks, Industrials, etc."];
_rule7 = format["NO BUILDING ON AIRFIELDS"];
_rule7sub = format["Bases found here will be deleted."];
_rule8 = format["READ THE RULES"];
_rule8sub = format["Its your responsibility to read these rules."];
_rule9 = format["NO GLITCHING"];
_rule9sub = format["Do not abuse game mechanics to gain an advantage."];
_rule10 = format["NO HACKING"];
_rule10sub = format["Any form of hacking will not be tolerated"];
_rule11 = format["Read more here..."];
_rule11sub = format["www.gsgaming.com.au"];

[format["<t size='0.5' align='left' color='#f2cb0b'> %1 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %2 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %3 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %4 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %5 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %6 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %7 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %8 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %9 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %10 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %11 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %12 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %13 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %14 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %15 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %16 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %17 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %18 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %19 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %20 </t><br /><t size='0.5' align='left' color='#f2cb0b'> %21 </t><br /><t size='0.4' align='left' color='#FFFFFF'> %22 </t>", _rule1, _rule1sub, _rule2, _rule2sub, _rule3, _rule3sub, _rule4, _rule4sub, _rule5, _rule5sub, _rule6, _rule6sub, _rule7, _rule7sub, _rule8, _rule8sub, _rule9, _rule9sub, _rule10, _rule10sub, _rule11, _rule11sub],safezoneX+0.30,safezoneY+0.1,35,0.1,0,3034] spawn BIS_fnc_dynamicText;