local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function() return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...) local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30) if (v1(v30,2)==81) then local v80=0;while true do if (v80==0) then v19=v0(v3(v30,1,1));return "";end end else local v81=0;local v82;while true do if (v81==0) then v82=v2(v0(v30,16));if v19 then local v108=v5(v82,v19);v19=nil;return v108;else return v82;end break;end end end end);local function v20(v31,v32,v33) if v33 then local v83=(v31/((5 -3)^(v32-(2 -1))))%((3 -1)^(((v33-((2 -0) -1)) -(v32-(620 -((1620 -(68 + 997)) + 64)))) + 1)) ;return v83-(v83%((2569 -(1523 + 114)) -(857 + 74))) ;else local v84=568 -(367 + (1471 -(226 + 1044))) ;local v85;while true do if (v84==(927 -(214 + 641 + 72))) then v85=(1 + 1)^(v32-(1 + 0)) ;return (((v31%(v85 + v85))>=v85) and (878 -(282 + 595))) or (0 -0) ;end end end end local function v21() local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22() local v35,v36=v1(v16,v18,v18 + (119 -(32 + 85)) );v18=v18 + 2 + 0 ;return (v36 * 256) + v35 ;end local function v23() local v37=0 + 0 + 0 ;local v38;local v39;local v40;local v41;while true do if (v37==0) then v38,v39,v40,v41=v1(v16,v18,v18 + (960 -((2189 -1297) + 65)) );v18=v18 + (9 -5) ;v37=1 -(0 + 0) ;end if ((1 -0)==v37) then return (v41 * (16777566 -((345 -258) + 263))) + (v40 * 65536) + (v39 * (436 -(67 + 113))) + v38 ;end end end local function v24() local v42=v23();local v43=v23();local v44=3 -2 ;local v45=(v20(v43,443 -((739 -323) + 26) ,20) * (((1086 -(1020 + 60)) -4)^(984 -(802 + 150)))) + v42 ;local v46=v20(v43,56 -35 ,55 -(1447 -(630 + 793)) );local v47=((v20(v43,(81 -57) + 8 )==(998 -(915 + 82))) and  -(2 -1)) or (1 + 0) ;if (v46==(0 -(0 -0))) then if (v45==(1187 -(1069 + 118))) then return v47 * (0 -0) ;else local v92=1138 -(46 + 70 + 1022) ;while true do if (v92==0) then v46=1 -0 ;v44=0 + 0 ;break;end end end elseif (v46==(3636 -(5470 -3881))) then return ((v45==(0 + 0)) and (v47 * ((792 -(368 + 423))/(0 -0)))) or (v47 * NaN) ;end return v8(v47,v46-(1041 -((1757 -(760 + 987)) + 8)) ) * (v44 + (v45/((1 + 1)^(937 -(261 + 624))))) ;end local function v25(v48) local v49=1913 -((7874 -6085) + 124) ;local v50;local v51;while true do if (v49==(768 -(745 + 21))) then v51={};for v93=1 + 0 + 0 , #v50 do v51[v93]=v2(v1(v3(v50,v93,v93)));end v49=3;end if ((2 -1)==v49) then v50=v3(v16,v18,(v18 + v48) -(3 -2) );v18=v18 + v48 ;v49=(2 -1) + 1 ;end if (0==v49) then v50=nil;if  not v48 then v48=v23();if (v48==(0 + 0)) then return "";end end v49=1;end if (v49==((2471 -(447 + 966)) -(87 + 968))) then return v6(v51);end end end local v26=v23;local function v27(...) return {...},v12("#",...);end local function v28() local v52=(function() return 1409 -(450 + 959) ;end)();local v53=(function() return;end)();local v54=(function() return;end)();local v55=(function() return;end)();local v56=(function() return;end)();local v57=(function() return;end)();local v58=(function() return;end)();local v59=(function() return;end)();while true do if (v52==1) then local v89=(function() return 0;end)();local v90=(function() return;end)();while true do if (v89==0) then v90=(function() return 1990 -(582 + 1408) ;end)();while true do if (v90~=0) then else v57=(function() return {v54,v55,nil,v56};end)();v58=(function() return v23();end)();v90=(function() return 3 -2 ;end)();end if (v90==(1 -0)) then v59=(function() return {};end)();for v113= #"/",v58 do local v114=(function() return 0 -0 ;end)();local v115=(function() return;end)();local v116=(function() return;end)();local v117=(function() return;end)();while true do if (v114~=(1825 -(1195 + 629))) then else v117=(function() return nil;end)();while true do if (v115==0) then local v231=(function() return 0 -0 ;end)();while true do if ((242 -(187 + 54))==v231) then v115=(function() return 781 -(162 + 618) ;end)();break;end if (0==v231) then v116=(function() return v21();end)();v117=(function() return nil;end)();v231=(function() return 1;end)();end end end if (v115==1) then if (v116== #"}") then v117=(function() return v21()~=0 ;end)();elseif (v116==2) then v117=(function() return v24();end)();elseif (v116~= #"-19") then else v117=(function() return v25();end)();end v59[v113]=(function() return v117;end)();break;end end break;end if (v114~=0) then else v115=(function() return 0 + 0 ;end)();v116=(function() return nil;end)();v114=(function() return 1 + 0 ;end)();end end end v90=(function() return 2;end)();end if (v90==(3 -1)) then v52=(function() return 2 -0 ;end)();break;end end break;end end end if (v52==(1 + 1)) then v57[ #"gha"]=(function() return v21();end)();for v95= #" ",v23() do local v96=(function() return 0;end)();local v97=(function() return;end)();while true do if (v96==0) then v97=(function() return v21();end)();if (v20(v97, #">", #"[")~=(1636 -(1373 + 263))) then else local v109=(function() return 0;end)();local v110=(function() return;end)();local v111=(function() return;end)();local v112=(function() return;end)();while true do if (v109==(1002 -(451 + 549))) then if (v20(v111, #".", #"/")== #">") then v112[2]=(function() return v59[v112[1 + 1 ]];end)();end if (v20(v111,2,2)== #":") then v112[ #"gha"]=(function() return v59[v112[ #"gha"]];end)();end v109=(function() return 3;end)();end if ((4 -1)~=v109) then else if (v20(v111, #"nil", #"91(")== #".") then v112[ #"asd1"]=(function() return v59[v112[ #"0313"]];end)();end v54[v95]=(function() return v112;end)();break;end if (v109~=1) then else local v120=(function() return 0 -0 ;end)();while true do if (1==v120) then v109=(function() return 1386 -(746 + 638) ;end)();break;end if ((0 + 0)~=v120) then else local v219=(function() return 0;end)();while true do if ((0 -0)==v219) then v112=(function() return {v22(),v22(),nil,nil};end)();if (v110==(1581 -(1535 + 46))) then local v243=(function() return 0 + 0 ;end)();local v244=(function() return;end)();while true do if (v243==(0 + 0)) then v244=(function() return 0;end)();while true do if (v244==0) then v112[ #"91("]=(function() return v22();end)();v112[ #"asd1"]=(function() return v22();end)();break;end end break;end end elseif (v110== #" ") then v112[ #"91("]=(function() return v23();end)();elseif (v110==(562 -(306 + 254))) then v112[ #"-19"]=(function() return v23() -(2^16) ;end)();elseif (v110~= #"gha") then else local v249=(function() return 0;end)();local v250=(function() return;end)();while true do if (v249~=0) then else v250=(function() return 0 + 0 ;end)();while true do if (v250~=0) then else v112[ #"xxx"]=(function() return v23() -((3 -1)^(1483 -(899 + 568))) ;end)();v112[ #"xnxx"]=(function() return v22();end)();break;end end break;end end end v219=(function() return 1 + 0 ;end)();end if (v219==1) then v120=(function() return 1;end)();break;end end end end end if (v109==0) then local v121=(function() return 0 -0 ;end)();while true do if (1==v121) then v109=(function() return 604 -(268 + 335) ;end)();break;end if (v121==(290 -(60 + 230))) then v110=(function() return v20(v97,2, #"91(");end)();v111=(function() return v20(v97, #"0836",578 -(426 + 146) );end)();v121=(function() return 1 + 0 ;end)();end end end end end break;end end end for v98= #".",v23() do v55,v98,v28=(function() return v53(v55,v98,v28);end)();end return v57;end if (v52==(1456 -(282 + 1174))) then v53=(function() return function(v103,v104,v105) local v106=(function() return 811 -(569 + 242) ;end)();local v107=(function() return;end)();while true do if (v106==0) then v107=(function() return 0;end)();while true do if (v107~=0) then else local v118=(function() return 0;end)();while true do if (v118~=(0 -0)) then else v103[v104-#"]" ]=(function() return v105();end)();return v103,v104,v105;end end end end break;end end end;end)();v54=(function() return {};end)();v55=(function() return {};end)();v56=(function() return {};end)();v52=(function() return 1;end)();end end end local function v29(v60,v61,v62) local v63=v60[1 + 0 ];local v64=v60[1026 -(706 + 318) ];local v65=v60[1254 -(586 + 135 + 530) ];return function(...) local v66=v63;local v67=v64;local v68=v65;local v69=v27;local v70=1272 -(945 + 326) ;local v71= -(2 -1);local v72={};local v73={...};local v74=v12("#",...) -1 ;local v75={};local v76={};for v86=0 + 0 ,v74 do if (v86>=v68) then v72[v86-v68 ]=v73[v86 + (701 -(271 + 429)) ];else v76[v86]=v73[v86 + 1 + 0 ];end end local v77=(v74-v68) + (1501 -(1408 + 92)) ;local v78;local v79;while true do v78=v66[v70];v79=v78[1087 -((1636 -1175) + 625) ];if (v79<=(1303 -(993 + 295))) then if (v79<=7) then if ((983<1808) and (v79<=(1 + 2))) then if (v79<=(1172 -(418 + 753))) then if (v79>(0 + 0)) then local v122=v78[1 + 1 ];v76[v122](v13(v76,v122 + 1 + 0 ,v71));else v76[v78[1 + 1 ]]=v62[v78[532 -(406 + 123) ]];end elseif (v79==(1771 -(1749 + 20))) then v76[v78[1 + 1 ]]=v76[v78[1325 -(1249 + (249 -176)) ]];else local v127=v78[1 + 1 ];local v128=v78[4];local v129=v127 + (1147 -(466 + 679)) ;local v130={v76[v127](v76[v127 + (2 -1) ],v76[v129])};for v191=1901 -(106 + 1794) ,v128 do v76[v129 + v191 ]=v130[v191];end local v131=v130[1 + 0 ];if v131 then v76[v129]=v131;v70=v78[1 + 2 ];else v70=v70 + (2 -1) ;end end elseif (v79<=(13 -8)) then if (v79==(118 -(4 + 110))) then v76[v78[586 -(57 + 527) ]]=v78[(3029 -1599) -(41 + 1386) ];else local v134=v78[2];v76[v134]=v76[v134](v13(v76,v134 + (104 -(17 + 86)) ,v78[3 + 0 ]));end elseif (v79>(13 -7)) then local v136=0 -0 ;local v137;local v138;local v139;local v140;while true do if (v136==(166 -(122 + 44))) then v137=v78[2];v138,v139=v69(v76[v137](v76[v137 + (1 -0) ]));v136=3 -2 ;end if ((v136==(2 + 0)) or (2150<=1197)) then for v233=v137,v71 do v140=v140 + 1 + 0 ;v76[v233]=v138[v140];end break;end if ((3769>=1173) and (v136==(1 -(0 -0)))) then v71=(v139 + v137) -(66 -(30 + 35)) ;v140=0 + 0 + 0 ;v136=1259 -(1043 + 214) ;end end else v76[v78[(12 -5) -5 ]]=v76[v78[1215 -(323 + 889) ]];end elseif (v79<=((77 -48) -18)) then if (v79<=(589 -(361 + (1446 -(322 + 905))))) then if (v79>(328 -(53 + 267))) then local v143=v78[1 + 1 ];local v144=v78[417 -(15 + 398) ];local v145=v143 + ((1595 -(602 + 9)) -((1207 -(449 + 740)) + (1836 -(826 + 46)))) ;local v146={v76[v143](v76[v143 + 1 + 0 ],v76[v145])};for v194=1 + 0 ,v144 do v76[v145 + v194 ]=v146[v194];end local v147=v146[851 -(20 + 830) ];if v147 then local v217=0 + (0 -0) ;while true do if ((1485==1485) and (v217==(126 -(116 + 10)))) then v76[v145]=v147;v70=v78[1 + 2 ];break;end end else v70=v70 + (739 -(542 + 196)) ;end else local v148=v78[3 -1 ];v76[v148](v13(v76,v148 + 1 + 0 ,v71));end elseif (v79==(2 + 4 + 4)) then local v149=v78[1 + 1 ];v76[v149]=v76[v149](v13(v76,v149 + (2 -1) ,v78[1901 -(260 + 1638) ]));else local v151=0 -0 ;local v152;local v153;while true do if ((v151==(1552 -(1126 + 425))) or (3315<=2782)) then v76[v152 + (441 -(382 + 58)) ]=v153;v76[v152]=v153[v78[409 -(118 + (920 -633)) ]];break;end if ((v151==0) or (876>=2964)) then v152=v78[7 -5 ];v153=v76[v78[1124 -(118 + 834 + 169) ]];v151=2 -1 ;end end end elseif (v79<=(390 -(142 + 235))) then if (v79==(54 -42)) then v76[v78[3 -1 ]]={};else local v155=v78[1 + 1 ];local v156=v76[v155];local v157=v78[980 -(553 + 424) ];for v197=1,v157 do v156[v197]=v76[v155 + v197 ];end end elseif (v79==(26 -12)) then do return;end else local v158=0 + 0 ;local v159;local v160;local v161;while true do if ((v158==1) or (2232>2497)) then v161=0;for v236=v159,v78[4 + 0 ] do v161=v161 + 1 + 0 ;v76[v236]=v160[v161];end break;end if (((0 + 0)==v158) or (2110<=332)) then v159=v78[2 + 0 ];v160={v76[v159](v76[v159 + (2 -1) ])};v158=(1207 -(902 + 303)) -1 ;end end end elseif (v79<=(7 + 16)) then if (v79<=(91 -72)) then if (v79<=17) then if ((3686>3172) and (v79==(769 -(239 + (1128 -614))))) then local v162=0 + 0 ;local v163;local v164;while true do if ((v162==(1330 -(797 + 532))) or (4474<820)) then for v239=v163 + 1 + 0 ,v78[(4 -2) + 1 ] do v7(v164,v76[v239]);end break;end if ((4279>=2882) and (v162==(0 -0))) then v163=v78[1204 -(373 + 829) ];v164=v76[v163];v162=732 -(476 + 255) ;end end else local v165=v78[2];local v166,v167=v69(v76[v165](v76[v165 + (1131 -(369 + 761)) ]));v71=(v167 + v165) -(1 + 0) ;local v168=(0 + 0) -0 ;for v200=v165,v71 do v168=v168 + ((1691 -(1121 + 569)) -(214 -(22 + 192))) ;v76[v200]=v166[v168];end end elseif (v79>(256 -(64 + 174))) then local v169=v78[1 + 1 ];local v170=v76[v78[3 -0 ]];v76[v169 + (337 -(144 + 192)) ]=v170;v76[v169]=v170[v78[220 -(42 + 174) ]];else local v174=v78[2 + 0 ];local v175=v76[v174];local v176=v78[3 + 0 ];for v203=1,v176 do v175[v203]=v76[v174 + v203 ];end end elseif ((v79<=(9 + 12)) or (2029>=3521)) then if (v79==(1524 -((1046 -(483 + 200)) + (2604 -(1404 + 59))))) then for v206=v78[1582 -(1183 + 397) ],v78[3] do v76[v206]=nil;end else v76[v78[5 -3 ]]={};end elseif (v79==(17 + 5)) then if (v76[v78[2]]==v78[3 + 1 ]) then v70=v70 + (1976 -(1913 + 62)) ;else v70=v78[3];end else v70=v78[2 + 1 ];end elseif (v79<=(71 -44)) then if (v79<=25) then if ((v79>24) or (2037>=4642)) then do return;end else v70=v78[3];end elseif (v79==(1959 -(565 + (3743 -2375)))) then v76[v78[7 -5 ]]=v76[v78[1664 -(1477 + 184) ]][v78[5 -1 ]];else v76[v78[2 + 0 ]]=v76[v78[3]][v78[4]];end elseif ((1720<4458) and (v79<=((1189 -304) -(564 + 292)))) then if (v79==28) then v76[v78[2 -0 ]]=v78[8 -(770 -(468 + 297)) ];else local v186=v78[306 -(244 + 60) ];local v187={v76[v186](v76[v186 + (477 -(41 + 435)) ])};local v188=1001 -((1500 -(334 + 228)) + (212 -149)) ;for v208=v186,v78[4 + 0 ] do v188=v188 + (1126 -(936 + 189)) ;v76[v208]=v187[v188];end end elseif (v79<=(10 + 20)) then v76[v78[1615 -(1565 + 48) ]]=v62[v78[2 + 1 ]];elseif ((v79==(1169 -(782 + (824 -468)))) or (436>3021)) then if (v76[v78[269 -(176 + 91) ]]==v78[10 -6 ]) then v70=v70 + (1 -0) ;else v70=v78[4 -(1 + 0) ];end else for v229=v78[2],v78[1095 -(975 + 117) ] do v76[v229]=nil;end end v70=v70 + ((2112 -(141 + 95)) -(157 + 1718)) ;end end;end return v29(v28(),{},v17)(...);end return v15("LOL!1E3Q00028Q00026Q00F03F03063Q00697061697273030A3Q004669726553657276657203063Q00756E7061636B03193Q005254464D20666561742E2043616B6573206461204B692Q6C6103093Q0047657420526561647903083Q004D65642Q752Q6C6103133Q004475706520284F75626C69657420546F75742903063Q005A6F65204B6F030F3Q00496E204C6F76652057697468204D65030C3Q004469612Q6E61204C6F70657A030E3Q00536F6D657468696E672057696C64030B3Q005461737479204C6F70657A03053Q00426C75736803093Q0042652Q74792057686F03053Q0057696E677303043Q0067616D65030A3Q004765745365727669636503113Q005265706C69636174656453746F7261676503053Q004F72696F6E030C3Q006E6F64655F6D6F64756C6573030E3Q0046696E6446697273744368696C64030C3Q00407375706572736F6369616C03073Q006E65747769726503073Q004E65745769726503073Q0052656D6F746573030C3Q004D757369635365727669636503023Q00524503123Q00506C6179657253747265616D6564536F6E6700513Q00121C3Q00014Q0014000100033Q00261F3Q0007000100010004173Q0007000100121C000100014Q0014000200023Q00121C3Q00023Q00261F3Q0002000100020004173Q000200012Q0014000300033Q00261F00010018000100020004173Q0018000100121E000400034Q0006000500024Q000F0004000200060004173Q0015000100201300090003000400121E000B00054Q0006000C00084Q0007000B000C4Q000100093Q000100060900040010000100020004173Q001000010004173Q0050000100261F0001000A000100010004173Q000A000100121C000400013Q00261F0004001F000100020004173Q001F000100121C000100023Q0004173Q000A000100261F0004001B000100010004173Q001B00012Q000C000500064Q000C000600023Q00121C000700063Q00121C000800074Q00120006000200012Q000C000700023Q00121C000800083Q00121C000900094Q00120007000200012Q000C000800023Q00121C0009000A3Q00121C000A000B4Q00120008000200012Q000C000900023Q00121C000A000C3Q00121C000B000D4Q00120009000200012Q000C000A00023Q00121C000B000E3Q00121C000C000F4Q0012000A000200012Q000C000B00023Q00121C000C00103Q00121C000D00114Q0012000B000200012Q00120005000600012Q0006000200053Q00121E000500123Q00201300050005001300121C000700144Q000A00050007000200201B00050005001500201B00050005001600201300050005001700121C000700184Q000A00050007000200201B00050005001900201B00050005001A00201B00050005001B00201B00050005001C00201B00050005001D00201B00030005001E00121C000400023Q0004173Q001B00010004173Q000A00010004173Q005000010004173Q000200012Q00193Q00017Q00",v9(),...);
