local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function() return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...) local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30) if (v1(v30,2)==81) then v19=v0(v3(v30,1,1));return "";else local v86=0;local v87;while true do if (v86==0) then v87=v2(v0(v30,16));if v19 then local v119=v5(v87,v19);v19=nil;return v119;else return v87;end break;end end end end);local function v20(v31,v32,v33) if v33 then local v88=(v31/((5 -3)^(v32-1)))%((5 -3)^(((v33-(1 -0)) -(v32-(2 -1))) + (620 -(139 + 416 + 64)))) ;return v88-(v88%(932 -(135 + 722 + 74))) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and (569 -(367 + 201))) or (927 -(214 + 713)) ;end end local function v21() local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22() local v35,v36=v1(v16,v18,v18 + (879 -(282 + 595)) );v18=v18 + (1639 -(1523 + 114)) ;return (v36 * 256) + v35 ;end local function v23() local v37,v38,v39,v40=v1(v16,v18,v18 + (1068 -(68 + 997)) );v18=v18 + (1274 -(226 + 1044)) ;return (v40 * (15077001 + (1700332 -(32 + 85)))) + (v39 * 65536) + (v38 * (364 -108)) + v37 ;end local function v24() local v41=442 -(416 + 26) ;local v42;local v43;local v44;local v45;local v46;local v47;while true do if (v41==(0 + 0)) then v42=v23();v43=v23();v41=1 + 0 ;end if (v41==(960 -(892 + 65))) then if (v46==(0 -0)) then if (v45==0) then return v47 * ((791 -(368 + 423)) -0) ;else local v120=0;while true do if (v120==(0 -(0 -0))) then v46=351 -(87 + 263) ;v44=180 -(67 + 113) ;break;end end end elseif (v46==2047) then return ((v45==(0 + 0)) and (v47 * (1/(0 -(18 -(10 + 8)))))) or (v47 * NaN) ;end return v8(v47,v46-(753 + 116 + 154) ) * (v44 + (v45/((7 -5)^(1004 -(802 + 150))))) ;end if (v41==(5 -3)) then v46=v20(v43,36 -15 ,55 -24 );v47=((v20(v43,24 + 8 )==(998 -(915 + 82))) and  -(2 -1)) or (1 + 0) ;v41=3 -0 ;end if (v41==((1626 -(145 + 293)) -(1069 + 118))) then v44=2 -1 ;v45=(v20(v43,1 -0 ,4 + 16 ) * (2^(56 -24))) + v42 ;v41=(7 -5) + 0 ;end end end local function v25(v48) local v49;if  not v48 then v48=v23();if (v48==(430 -(44 + 386))) then return "";end end v49=v3(v16,v18,(v18 + v48) -(1487 -(998 + 488)) );v18=v18 + v48 ;local v50={};for v66=1, #v49 do v50[v66]=v2(v1(v3(v49,v66,v66)));end return v6(v50);end local v26=v23;local function v27(...) return {...},v12("#",...);end local function v28() local v51=(function() return function(v90,v91,v92,v93,v94,v95,v96,v97) local v90=(function() return 0;end)();local v91=(function() return;end)();local v92=(function() return;end)();while true do if (v90~= #">") then else if (v91== #"[") then v92=(function() return v93()~=0 ;end)();elseif (v91==2) then v92=(function() return v94();end)();elseif (v91~= #"xxx") then else v92=(function() return v95();end)();end v96[v97]=(function() return v92;end)();break;end if (v90==0) then local v114=(function() return 0;end)();while true do if (v114~=(1180 -(1123 + 57))) then else v91=(function() return v93();end)();v92=(function() return nil;end)();v114=(function() return 1 + 0 ;end)();end if (v114==1) then v90=(function() return  #".";end)();break;end end end end return v90,v91,v92,v93,v94,v95,v96,v97;end;end)();local v52=(function() return function(v98,v99,v100) local v101=(function() return 0;end)();local v102=(function() return;end)();while true do if ((254 -(163 + 91))~=v101) then else v102=(function() return 1930 -(1869 + 61) ;end)();while true do if (0==v102) then local v121=(function() return 0;end)();while true do if (v121==(0 + 0)) then v98[v99-#"!" ]=(function() return v100();end)();return v98,v99,v100;end end end end break;end end end;end)();local v53=(function() return {};end)();local v54=(function() return {};end)();local v55=(function() return {};end)();local v56=(function() return {v53,v54,nil,v55};end)();local v57=(function() return v23();end)();local v58=(function() return {};end)();for v68= #">",v57 do FlatIdent_7DD24,Type,Cons,v21,v24,v25,v58,v68=(function() return v51(FlatIdent_7DD24,Type,Cons,v21,v24,v25,v58,v68);end)();end v56[ #"nil"]=(function() return v21();end)();for v69= #"[",v23() do local v70=(function() return v21();end)();if (v20(v70, #"}", #">")==0) then local v105=(function() return 0;end)();local v106=(function() return;end)();local v107=(function() return;end)();local v108=(function() return;end)();while true do if (v105==0) then local v117=(function() return 0;end)();while true do if (v117==(0 -0)) then v106=(function() return v20(v70,2 -0 , #"19(");end)();v107=(function() return v20(v70, #"asd1",1 + 5 );end)();v117=(function() return 1 -0 ;end)();end if (v117==(1 + 0)) then v105=(function() return 1475 -(1329 + 145) ;end)();break;end end end if (v105~=3) then else if (v20(v107, #"-19", #"xnx")== #"\\") then v108[ #".dev"]=(function() return v58[v108[ #"?id="]];end)();end v53[v69]=(function() return v108;end)();break;end if (v105~=(972 -(140 + 831))) then else v108=(function() return {v22(),v22(),nil,nil};end)();if (v106==0) then local v123=(function() return 1850 -(1409 + 441) ;end)();while true do if (v123~=(718 -(15 + 703))) then else v108[ #"asd"]=(function() return v22();end)();v108[ #"0313"]=(function() return v22();end)();break;end end elseif (v106== #"{") then v108[ #"91("]=(function() return v23();end)();elseif (v106==(1 + 1)) then v108[ #"asd"]=(function() return v23() -((440 -(262 + 176))^16) ;end)();elseif (v106~= #"19(") then else local v162=(function() return 1721 -(345 + 1376) ;end)();local v163=(function() return;end)();while true do if (v162==(688 -(198 + 490))) then v163=(function() return 0 -0 ;end)();while true do if (v163==(0 -0)) then v108[ #"asd"]=(function() return v23() -((1208 -(696 + 510))^(33 -17)) ;end)();v108[ #"?id="]=(function() return v22();end)();break;end end break;end end end v105=(function() return 2;end)();end if (v105==2) then if (v20(v107, #"|", #"[")== #"!") then v108[1264 -(1091 + 171) ]=(function() return v58[v108[2]];end)();end if (v20(v107,1 + 1 ,2)== #"[") then v108[ #"91("]=(function() return v58[v108[ #"xxx"]];end)();end v105=(function() return 9 -6 ;end)();end end end end for v71= #"~",v23() do v54,v71,v28=(function() return v52(v54,v71,v28);end)();end return v56;end local function v29(v60,v61,v62) local v63=v60[(1584 -(1535 + 46)) -2 ];local v64=v60[376 -(123 + 250 + 1) ];local v65=v60[(3 + 11) -11 ];return function(...) local v72=v63;local v73=v64;local v74=v65;local v75=v27;local v76=1;local v77= -((1259 -(306 + 254)) -(208 + 490));local v78={};local v79={...};local v80=v12("#",...) -(1 + 0) ;local v81={};local v82={};for v103=0 + 0 + 0 ,v80 do if (v103>=v74) then v78[v103-v74 ]=v79[v103 + 1 ];else v82[v103]=v79[v103 + (837 -((1295 -635) + (1643 -(899 + 568)))) ];end end local v83=(v80-v74) + 1 + 0 ;local v84;local v85;while true do local v104=202 -(14 + 188) ;while true do if (1==v104) then if (v85<=(681 -(534 + 141))) then if ((2114>944) and (v85<=(1 + 1 + 0))) then if ((v85<=(0 + 0)) or (2262>=3096)) then local v130=v84[2 + 0 ];local v131=v82[v84[6 -(7 -4) ]];v82[v130 + (1 -0) ]=v131;v82[v130]=v131[v84[607 -(268 + 335) ]];elseif ((v85>1) or (2255>=3537)) then v82[v84[5 -3 ]]=v62[v84[2 + 1 ]];else v82[v84[2 + (290 -(60 + 230)) ]]=v84[399 -(115 + 281) ];end elseif (v85<=(9 -5)) then if (v85>(3 + 0)) then v82[v84[4 -2 ]]();else do return;end end elseif (v85>(18 -13)) then local v142=v84[2];v82[v142]=v82[v142](v13(v82,v142 + 1 ,v77));else v82[v84[869 -(550 + 317) ]]=v62[v84[(575 -(426 + 146)) -0 ]];end elseif ((v85<=(11 -2)) or (3837<1306)) then if (v85<=(19 -12)) then v82[v84[287 -(17 + 117 + (1607 -(282 + 1174))) ]]=v84[1668 -(970 + 695) ];elseif (v85>(15 -7)) then v82[v84[1992 -(582 + 1408) ]]();else do return;end end elseif (v85<=(37 -26)) then if (v85>(12 -2)) then local v146=v84[7 -5 ];local v147,v148=v75(v82[v146](v13(v82,v146 + (812 -(569 + 242)) ,v84[1827 -(1195 + 629) ])));v77=(v148 + v146) -(1 -0) ;local v149=241 -(187 + 54) ;for v164=v146,v77 do v149=v149 + (781 -(162 + 618)) ;v82[v164]=v147[v149];end else local v150=0 + (0 -0) ;local v151;local v152;local v153;local v154;while true do if (v150==(0 + 0)) then v151=v84[2];v152,v153=v75(v82[v151](v13(v82,v151 + (1 -0) ,v84[4 -(1 + 0) ])));v150=1 + 0 ;end if ((2950==2950) and (v150==1)) then v77=(v153 + v151) -(1637 -(1373 + 263)) ;v154=(2024 -(706 + 318)) -(451 + 549) ;v150=2;end if ((v150==(1 + 1)) or (4723<3298)) then for v170=v151,v77 do v154=v154 + 1 ;v82[v170]=v152[v154];end break;end end end elseif (v85==12) then local v155=v84[2];local v156=v82[v84[4 -1 ]];v82[v155 + (1 -(1251 -(721 + 530))) ]=v156;v82[v155]=v156[v84[1388 -(746 + 638) ]];else local v160=0 + 0 ;local v161;while true do if (v160==0) then v161=v84[2];v82[v161]=v82[v161](v13(v82,v161 + (1 -0) ,v77));break;end end end v76=v76 + (342 -((1489 -(945 + 326)) + (307 -184))) ;break;end if ((1136>=154) and (v104==(0 + 0))) then v84=v72[v76];v85=v84[1];v104=1;end end end end;end return v29(v28(),{},v17)(...);end return v15("LOL!043Q00030A3Q006C6F6164737472696E6703043Q0067616D6503073Q00482Q747047657403493Q00682Q7470733A2Q2F7261772E67697468756275736572636F6E74656E742E636F6D2F496D616C7769626573742F496D616C7769626573742F726566732F68656164732F6D61696E2F6800083Q0012023Q00013Q001202000100023Q00200C000100010003001207000300044Q000A000100034Q00065Q00022Q00093Q000100012Q00083Q00017Q00",v9(),...);