local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function() return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...) local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30) if (v1(v30,2)==81) then v19=v0(v3(v30,1,1));return "";else local v79=v2(v0(v30,16));if v19 then local v89=0;local v90;while true do if (v89==1) then return v90;end if (v89==0) then v90=v5(v79,v19);v19=nil;v89=1;end end else return v79;end end end);local function v20(v31,v32,v33) if v33 then local v80=0;local v81;while true do if (v80==(0 -0)) then v81=(v31/(2^(v32-((1639 -(1523 + 114)) -(1 + 0)))))%((3 -(1 -0))^(((v33-(2 -1)) -(v32-(620 -(555 + 64)))) + (932 -(857 + 74)))) ;return v81-(v81%(569 -(367 + 201))) ;end end else local v82=927 -(214 + 713) ;local v83;while true do if (v82==0) then v83=(1 + 1)^(v32-(1 + 0)) ;return (((v31%(v83 + v83))>=v83) and (878 -(282 + 595))) or 0 ;end end end end local function v21() local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22() local v35=1065 -(68 + 222 + 775) ;local v36;local v37;while true do if (v35==(1270 -(226 + 1044))) then v36,v37=v1(v16,v18,v18 + 2 );v18=v18 + ((965 -(892 + 65)) -6) ;v35=(281 -163) -(32 + (157 -72)) ;end if (v35==1) then return (v37 * (251 + 5)) + v36 ;end end end local function v23() local v38,v39,v40,v41=v1(v16,v18,v18 + ((9 -5) -1) );v18=v18 + (354 -(87 + 263)) ;return (v41 * (16777396 -(67 + 113))) + (v40 * 65536) + (v39 * (188 + 68)) + v38 ;end local function v24() local v42=v23();local v43=v23();local v44=3 -(887 -(261 + 624)) ;local v45=(v20(v43,1 + 0 ,(257 -181) -56 ) * ((7 -5)^(984 -(802 + 150)))) + v42 ;local v46=v20(v43,(47 -37) + 11 ,(33 + 50) -52 );local v47=((v20(v43,57 -25 )==(1 + 0)) and  -(998 -(915 + 82))) or (2 -1) ;if (v46==(0 + 0)) then if (v45==(0 + (0 -0))) then return v47 * (1138 -(116 + 1022)) ;else local v91=0 -0 ;while true do if (v91==((2109 -922) -(1069 + 118))) then v46=1;v44=(1080 -(1020 + 60)) -(1747 -(760 + 987)) ;break;end end end elseif (v46==(7269 -5222)) then return ((v45==(0 -0)) and (v47 * (((1424 -(630 + 793)) + (1913 -(1789 + 124)))/(0 -0)))) or (v47 * NaN) ;end return v8(v47,v46-(1015 + 8) ) * (v44 + (v45/((1 + 1)^(843 -(368 + 423))))) ;end local function v25(v48) local v49=0 + 0 ;local v50;local v51;while true do if (v49==(767 -((1121 -(85 + 291)) + 21))) then v50=v3(v16,v18,(v18 + v48) -(1 + 0) );v18=v18 + v48 ;v49=5 -3 ;end if (v49==(11 -8)) then return v6(v51);end if (v49==(703 -(376 + (1590 -(243 + 1022))))) then v51={};for v92=1, #v50 do v51[v92]=v2(v1(v3(v50,v92,v92)));end v49=1 + 2 ;end if (v49==(0 -0)) then v50=nil;if  not v48 then local v102=0 + 0 ;while true do if (v102==(1055 -(87 + 968))) then v48=v23();if (v48==(0 -0)) then return "";end break;end end end v49=4 -3 ;end end end local v26=v23;local function v27(...) return {...},v12("#",...);end local function v28() local v52=(function() return 0 -0 ;end)();local v53=(function() return;end)();local v54=(function() return;end)();local v55=(function() return;end)();local v56=(function() return;end)();local v57=(function() return;end)();local v58=(function() return;end)();while true do if (v52~= #"<") then else local v86=(function() return 0;end)();while true do if (v86==(5 -3)) then v52=(function() return 2;end)();break;end if (v86==0) then v57=(function() return v23();end)();v58=(function() return {};end)();v86=(function() return 1770 -(1749 + 20) ;end)();end if (v86~=1) then else for v111= #".",v57 do local v112=(function() return 0;end)();local v113=(function() return;end)();local v114=(function() return;end)();local v115=(function() return;end)();while true do if (v112==(1 + 0)) then v115=(function() return nil;end)();while true do if (v113==0) then local v126=(function() return 0;end)();local v127=(function() return;end)();while true do if (v126==0) then v127=(function() return 0;end)();while true do if (v127==0) then v114=(function() return v21();end)();v115=(function() return nil;end)();v127=(function() return 1323 -(1249 + 73) ;end)();end if (v127~=(1 + 0)) then else v113=(function() return  #".";end)();break;end end break;end end end if (v113== #">") then if (v114== #"|") then v115=(function() return v21()~=0 ;end)();elseif (v114==(1147 -(466 + 679))) then v115=(function() return v24();end)();elseif (v114~= #"xxx") then else v115=(function() return v25();end)();end v58[v111]=(function() return v115;end)();break;end end break;end if (v112==0) then local v118=(function() return 0;end)();local v119=(function() return;end)();while true do if (v118==0) then v119=(function() return 0;end)();while true do if (v119==0) then v113=(function() return 0;end)();v114=(function() return nil;end)();v119=(function() return 2 -1 ;end)();end if (v119==(2 -1)) then v112=(function() return 1901 -(106 + 1794) ;end)();break;end end break;end end end end end v56[ #"gha"]=(function() return v21();end)();v86=(function() return 1 + 1 ;end)();end end end if ((1 + 1)==v52) then for v94= #".",v23() do local v95=(function() return v21();end)();if (v20(v95, #":", #"\\")~=0) then else local v106=(function() return 0 -0 ;end)();local v107=(function() return;end)();local v108=(function() return;end)();local v109=(function() return;end)();local v110=(function() return;end)();while true do if (v106==(2 -1)) then local v116=(function() return 114 -(4 + 110) ;end)();while true do if (v116==1) then v106=(function() return 2;end)();break;end if ((584 -(57 + 527))~=v116) then else v109=(function() return nil;end)();v110=(function() return nil;end)();v116=(function() return 1;end)();end end end if (v106~=2) then else while true do if (v107== #"nil") then if (v20(v109, #"-19", #"-19")~= #"\\") then else v110[ #"asd1"]=(function() return v58[v110[ #"0836"]];end)();end v53[v94]=(function() return v110;end)();break;end if (v107~=(1429 -(41 + 1386))) then else local v121=(function() return 0;end)();local v122=(function() return;end)();while true do if (v121==0) then v122=(function() return 103 -(17 + 86) ;end)();while true do if (1==v122) then v107=(function() return  #"nil";end)();break;end if (v122~=(0 + 0)) then else if (v20(v109, #"|", #",")== #"\\") then v110[2]=(function() return v58[v110[2]];end)();end if (v20(v109,3 -1 ,2)~= #"}") then else v110[ #"19("]=(function() return v58[v110[ #"91("]];end)();end v122=(function() return 2 -1 ;end)();end end break;end end end if (v107~=(166 -(122 + 44))) then else local v123=(function() return 0;end)();local v124=(function() return;end)();while true do if (v123==(0 -0)) then v124=(function() return 0 -0 ;end)();while true do if (v124==(0 + 0)) then v108=(function() return v20(v95,1 + 1 , #"asd");end)();v109=(function() return v20(v95, #"0836",11 -5 );end)();v124=(function() return 66 -(30 + 35) ;end)();end if (v124==(1 + 0)) then v107=(function() return  #"|";end)();break;end end break;end end end if (v107~= #":") then else local v125=(function() return 0;end)();while true do if ((1257 -(1043 + 214))==v125) then v110=(function() return {v22(),v22(),nil,nil};end)();if (v108==0) then local v174=(function() return 0;end)();local v175=(function() return;end)();while true do if ((0 -0)==v174) then v175=(function() return 1212 -(323 + 889) ;end)();while true do if (v175==(0 -0)) then v110[ #"nil"]=(function() return v22();end)();v110[ #"http"]=(function() return v22();end)();break;end end break;end end elseif (v108== #"]") then v110[ #"-19"]=(function() return v23();end)();elseif (v108==2) then v110[ #"gha"]=(function() return v23() -(2^(596 -(361 + 219))) ;end)();elseif (v108== #"xxx") then local v248=(function() return 320 -(53 + 267) ;end)();local v249=(function() return;end)();while true do if (0~=v248) then else v249=(function() return 0 + 0 ;end)();while true do if (v249==0) then v110[ #"gha"]=(function() return v23() -((415 -(15 + 398))^(998 -(18 + 964))) ;end)();v110[ #".com"]=(function() return v22();end)();break;end end break;end end end v125=(function() return 3 -2 ;end)();end if (v125==(1 + 0)) then v107=(function() return 2 + 0 ;end)();break;end end end end break;end if (v106==(850 -(20 + 830))) then local v117=(function() return 0;end)();while true do if (v117==(0 + 0)) then v107=(function() return 0;end)();v108=(function() return nil;end)();v117=(function() return 1;end)();end if ((127 -(116 + 10))==v117) then v106=(function() return 1 + 0 ;end)();break;end end end end end end for v96= #"}",v23() do v54[v96-#"]" ]=(function() return v28();end)();end return v56;end if (v52==0) then local v87=(function() return 738 -(542 + 196) ;end)();local v88=(function() return;end)();while true do if (v87~=0) then else v88=(function() return 0 -0 ;end)();while true do if (v88~=1) then else v55=(function() return {};end)();v56=(function() return {v53,v54,nil,v55};end)();v88=(function() return 2;end)();end if (v88==0) then v53=(function() return {};end)();v54=(function() return {};end)();v88=(function() return 1 + 0 ;end)();end if (v88==(2 + 0)) then v52=(function() return  #" ";end)();break;end end break;end end end end end local function v29(v59,v60,v61) local v62=v59[1 + 0 ];local v63=v59[4 -2 ];local v64=v59[7 -4 ];return function(...) local v65=v62;local v66=v63;local v67=v64;local v68=v27;local v69=(2821 -(231 + 1038)) -(1126 + 425) ;local v70= -1;local v71={};local v72={...};local v73=v12("#",...) -(3 -2) ;local v74={};local v75={};for v84=1121 -(118 + 1003) ,v73 do if (v84>=v67) then v71[v84-v67 ]=v72[v84 + 1 ];else v75[v84]=v72[v84 + (2 -1) ];end end local v76=(v73-v67) + 1 ;local v77;local v78;while true do local v85=377 -(142 + 235) ;while true do if (v85==(4 -3)) then if (v78<=21) then if (v78<=(3 + 6 + 1)) then if ((v78<=(981 -(553 + (1586 -(171 + 991))))) or (3772<=1782)) then if (v78<=(1 -0)) then if (v78==(0 + 0)) then if (v77[861 -((989 -749) + 619) ]==v75[v77[(10 -6) + (0 -0) ]]) then v69=v69 + 1 + 0 + 0 ;else v69=v77[1 + 2 ];end else v75[v77[1746 -(1344 + 400) ]][v77[2 + 1 ]]=v75[v77[3 + 1 ]];end elseif ((v78<=(4 -2)) or (4700<813)) then v75[v77[2]]=v75[v77[7 -4 ]][v77[8 -4 ]];elseif (v78==(1 + 2)) then local v177=v77[2];v75[v177]=v75[v177]();else v75[v77[9 -7 ]]=v75[v77[756 -(239 + 514) ]];end elseif (v78<=(3 + 4)) then if (v78<=(1334 -(797 + 532))) then local v134=v77[2 + 0 ];local v135=v75[v77[2 + 1 ]];v75[v134 + (2 -1) ]=v135;v75[v134]=v135[v77[1206 -(373 + 829) ]];elseif (v78>(737 -(476 + 255))) then local v181=1130 -(369 + 761) ;local v182;while true do if ((3199<4050) and (v181==(0 + 0))) then v182=v77[2 -0 ];v75[v182](v13(v75,v182 + (1 -0) ,v77[241 -(64 + 174) ]));break;end end else for v216=v77[1 + (3 -2) ],v77[1 + 2 ] do v75[v216]=nil;end end elseif (v78<=(11 -3)) then v75[v77[338 -(144 + 192) ]][v77[1496 -(711 + 782) ]]=v75[v77[220 -(42 + 174) ]];elseif ((v78==(7 + 2)) or (4951<4430)) then local v183=v77[2 + 0 ];v75[v183]=v75[v183]();else for v218=v77[1 + 1 ],v77[1507 -(363 + 1141) ] do v75[v218]=nil;end end elseif ((96==96) and (v78<=(1834 -(580 + 1239)))) then if (v78<=((4592 -3000) -(1183 + 397))) then if ((v78>(33 -22)) or (2739>4008)) then v75[v77[2 + 0 ]]=v29(v66[v77[2 + 1 ]],nil,v61);else v75[v77[2 + 0 ]]=v77[(3188 -1210) -(1913 + 62) ];end elseif (v78<=(9 + 4)) then local v144=v77[1169 -((1993 -1348) + 522) ];v75[v144]=v75[v144](v13(v75,v144 + 1 + 0 ,v70));elseif (v78==14) then v75[v77[(1253 -(111 + 1137)) -3 ]]=v75[v77[1936 -(565 + 1368) ]][v77[15 -11 ]];else do return;end end elseif (v78<=(1679 -(1477 + (342 -(91 + 67))))) then if (v78<=(46 -30)) then v75[v77[(5470 -3632) -(1045 + 791) ]]=v77[3 -0 ];elseif (v78>(16 + 1)) then v75[v77[858 -(564 + 292) ]]=v29(v66[v77[4 -(1 + 0) ]],nil,v61);else v69=v77[4 -1 ];end elseif (v78<=(56 -37)) then v75[v77[306 -(244 + 60) ]]=v75[v77[6 -3 ]];elseif (v78>(1579 -(1381 + (701 -(423 + 100))))) then local v189=0 + 0 ;local v190;local v191;local v192;local v193;while true do if (v189==(476 -(41 + 435))) then v190=v77[2];v191,v192=v68(v75[v190](v13(v75,v190 + 1 ,v77[1004 -(938 + 63) ])));v189=1 + 0 ;end if ((v189==(3 -2)) or (23==1134)) then v70=(v192 + v190) -(1126 -(936 + 189)) ;v193=0 + 0 + 0 ;v189=2 + 0 ;end if (v189==(1615 -((4332 -2767) + 48))) then for v240=v190,v70 do local v241=0 + 0 ;while true do if ((v241==(1138 -(782 + 356))) or (2693>=4111)) then v193=v193 + (268 -(176 + 91)) ;v75[v240]=v191[v193];break;end end end break;end end else local v194=0 -0 ;local v195;while true do if (v194==(1784 -(214 + 1570))) then v195=v77[2 -0 ];v75[v195](v13(v75,v195 + (1093 -(975 + 117)) ,v77[2 + 1 ]));break;end end end elseif ((v78<=(1907 -(157 + 1718))) or (4316<=2146)) then if ((v78<=(22 + 4)) or (3546<=2809)) then if (v78<=(81 -58)) then if (v78>(75 -53)) then local v150=v77[1020 -(697 + 321) ];local v151,v152=v68(v75[v150](v75[v150 + (2 -1) ]));v70=(v152 + v150) -(1 -0) ;local v153=0;for v171=v150,v70 do v153=v153 + 1 ;v75[v171]=v151[v153];end else local v154=v77[4 -2 ];v75[v154]=v75[v154](v13(v75,v154 + 1 + 0 ,v70));end elseif ((4904>2166) and (v78<=(44 -20))) then local v156=v77[5 -3 ];v75[v156]=v75[v156](v13(v75,v156 + 1 + 0 ,v77[1230 -(322 + 905) ]));elseif (v78==(12 + 10 + 3)) then local v196=v77[613 -(602 + 9) ];v75[v196](v75[v196 + ((1961 -(326 + 445)) -((1959 -1510) + 740)) ]);else v75[v77[874 -(826 + 46) ]]={};end elseif (v78<=(976 -(245 + 702))) then if (v78<=((188 -103) -58)) then local v158=0;local v159;local v160;while true do if ((816 -(98 + 717))==v158) then v75[v159 + 1 + 0 ]=v160;v75[v159]=v160[v77[(4439 -2537) -((971 -(530 + 181)) + (2519 -(614 + 267))) ]];break;end if (v158==((472 -(19 + 13)) -((621 -239) + 58))) then v159=v77[6 -4 ];v160=v75[v77[3 + 0 ]];v158=1 -0 ;end end elseif (v78==(83 -55)) then local v198=1205 -(902 + 303) ;local v199;while true do if (v198==(0 -0)) then v199=v77[4 -2 ];v75[v199](v13(v75,v199 + 1 + (0 -0) ,v70));break;end end else local v200=1690 -(1121 + 569) ;local v201;while true do if ((109>=90) and ((214 -(22 + 192))==v200)) then v201=v77[685 -(483 + 200) ];v75[v201](v13(v75,v201 + (2 -1) + 0 ,v70));break;end end end elseif (v78<=(1493 -(1404 + 59))) then v75[v77[2 + 0 ]]={};elseif ((4978>2905) and (v78>((22 + 62) -53))) then local v202=v77[(2523 -1088) -(797 + 636) ];v75[v202]=v75[v202](v13(v75,v202 + ((1 -0) -0) ,v77[768 -(468 + 297) ]));elseif ((v75[v77[1621 -(1427 + 192) ]]==v77[566 -(334 + 228) ]) or (3026<=2280)) then v69=v69 + 1 + 0 ;else v69=v77[10 -7 ];end elseif (v78<=(85 -48)) then if ((v78<=(61 -27)) or (1653<=1108)) then if (v78>(10 + 23)) then v75[v77[(2050 -(1293 + 519)) -(141 + (193 -98)) ]][v77[3 + 0 ]]=v77[9 -5 ];elseif (v75[v77[2 + 0 ]]==v77[4 + 0 ]) then v69=v69 + (2 -1) ;else v69=v77[1 + 2 ];end elseif (v78<=35) then local v164=(0 -0) -0 ;local v165;local v166;local v167;local v168;while true do if (v164==((1 -0) + 0)) then v70=(v167 + v165) -((4 -3) + 0) ;v168=0 -(0 -0) ;v164=2 -0 ;end if ((0 + 0)==v164) then v165=v77[165 -(92 + 71) ];v166,v167=v68(v75[v165](v75[v165 + 1 + 0 ]));v164=1 + 0 ;end if ((2909>2609) and (v164==(2 -0))) then for v230=v165,v70 do local v231=0;while true do if (v231==(0 + 0)) then v168=v168 + (766 -(574 + 191)) ;v75[v230]=v166[v168];break;end end end break;end end elseif (v78==36) then v75[v77[1 + 1 + 0 ]][v77[3 + 0 ]]=v77[9 -5 ];else v75[v77[2 + 0 ]]=v61[v77[852 -(254 + 595) ]];end elseif ((757>194) and (v78<=(166 -(55 + 71)))) then if (v78<=(49 -11)) then if (v77[2]==v75[v77[1794 -(573 + 249 + 968) ]]) then v69=v69 + (2 -1) ;else v69=v77[1 + 2 ];end elseif ((v78==(62 -23)) or (31>=1398)) then v69=v77[942 -(714 + 225) ];else local v211=v77[5 -(6 -3) ];local v212,v213=v68(v75[v211](v13(v75,v211 + (1 -0) ,v77[1 + 2 ])));v70=(v213 + v211) -(1 -0) ;local v214=806 -(118 + 688) ;for v226=v211,v70 do local v227=48 -(25 + 6 + 17) ;while true do if ((0 + 0 + 0)==v227) then v214=v214 + (1887 -(927 + 959)) ;v75[v226]=v212[v214];break;end end end end elseif ((3196<=4872) and (v78<=((87 + 51) -97))) then v75[v77[1319 -(1114 + 203) ]]=v61[v77[735 -((1112 -(709 + 387)) + 716) ]];elseif (v78==(80 -38)) then do return;end else local v215=v77[1 + 1 ];v75[v215](v75[v215 + 1 + 0 ]);end v69=v69 + ((1956 -(673 + 1185)) -((31 -20) + 86)) ;break;end if ((3326==3326) and (v85==(0 -0))) then v77=v65[v69];v78=v77[1906 -(830 + 1075) ];v85=(918 -632) -(175 + 110) ;end end end end;end return v29(v28(),{},v17)(...);end return v15("LOL!1A3Q0003043Q0067616D6503073Q00506C6163654964022Q00F84FEB830842028Q00026Q000840026Q00F03F026Q001040030A3Q00412Q6453656374696F6E03133Q00496E666F726D6174696F6E2F53752Q706F727403093Q00412Q6442752Q746F6E03073Q004275792055474303073Q00556E6B6E6F776E030E3Q00446973636F726420536572766572030A3Q006C6F6164737472696E6703073Q00482Q747047657403573Q00682Q7470733A2Q2F7261772E67697468756275736572636F6E74656E742E636F6D2F496D616C7769626573742F496D616C7769626573742F726566732F68656164732F6D61696E2F466C7578757325323055692E6C6962030C3Q0043726561746557696E646F7703123Q00457363617065205069726174652043617665027Q004003063Q004E657754616203043Q004D61696E2Q033Q00554743030A3Q004765745365727669636503123Q004D61726B6574706C6163655365727669636503073Q00506C6179657273030B3Q004C6F63616C506C61796572005B3Q0012253Q00013Q00200E5Q00020026213Q005A000100030004273Q005A00010012103Q00044Q0006000100073Q0026213Q001A000100050004273Q001A0001001210000800043Q0026210008000D000100060004273Q000D00010012103Q00073Q0004273Q001A000100262100080009000100040004273Q0009000100201B000900050008001210000B00094Q00180009000B00022Q0013000700093Q00201B00090006000A001210000B000B3Q001210000C000C3Q000212000D6Q00140009000D0001001210000800063Q0004273Q000900010026213Q0022000100070004273Q0022000100201B00080007000A001210000A000D3Q001210000B000C3Q000212000C00014Q00140008000C00010004273Q005A00010026213Q0031000100040004273Q003100010012250008000E3Q001225000900013Q00201B00090009000F001210000B00104Q00280009000B4Q001600083Q00022Q00090008000100022Q0013000100083Q00201B000800010011001210000A00124Q00180008000A00022Q0013000200083Q0012103Q00063Q0026213Q0044000100130004273Q00440001001210000800043Q0026210008003F000100040004273Q003F000100201B000900020014001210000B00154Q00180009000B00022Q0013000500093Q00201B000900050008001210000B00164Q00180009000B00022Q0013000600093Q001210000800063Q00262100080034000100060004273Q003400010012103Q00053Q0004273Q004400010004273Q003400010026213Q0006000100060004273Q00060001001210000800043Q000E2Q0006004B000100080004273Q004B00010012103Q00133Q0004273Q0006000100262100080047000100040004273Q00470001001225000900013Q00201B000900090017001210000B00184Q00180009000B00022Q0013000300093Q001225000900013Q00201B000900090017001210000B00194Q00180009000B000200200E00040009001A001210000800063Q0004273Q004700010004273Q000600012Q002A3Q00013Q00023Q000C3Q00028Q00026Q00F03F022Q007889F90A0B42027Q004003043Q0067616D65030A3Q004765745365727669636503073Q00506C6179657273030B3Q004C6F63616C506C6179657203113Q005265706C69636174656453746F7261676503153Q00544753436174616C6F674974656D735F4571756970030C3Q00496E766F6B6553657276657203063Q00756E7061636B001A3Q0012103Q00014Q0006000100013Q0026213Q0002000100010004273Q000200012Q001E00023Q0002003024000200020003001225000300053Q00201B000300030006001210000500074Q001800030005000200200E0003000300080010010002000400032Q0013000100023Q001225000200053Q00201B000200020006001210000400094Q001800020004000200200E00020002000A00201B00020002000B0012250004000C4Q0013000500014Q0023000400054Q001C00023Q00010004273Q001900010004273Q000200012Q002A3Q00017Q00023Q00030C3Q00736574636C6970626F617264031D3Q00682Q7470733A2Q2F646973636F72642E2Q672F63705855546D4D2Q586400043Q0012253Q00013Q001210000100024Q00193Q000200012Q002A3Q00017Q00",v9(),...);