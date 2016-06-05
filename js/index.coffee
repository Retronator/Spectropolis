$(document).ready ->
	# Convert the csv into a JSON we can use
	gamesCsv = """
		001,180,http://www.worldofspectrum.org/infoseekid.cgi?id=0017591,http://i.imgur.com/JgPkmyp.png,,http://i.imgur.com/4O2ReTf.gif,,,,,,,
		002,720 Degrees,http://www.worldofspectrum.org/infoseekid.cgi?id=0000041,http://i.imgur.com/6rgy3MW.png,,http://i.imgur.com/3mBqs4V.png,,,,,,,
		003,Agent X,http://www.worldofspectrum.org/infoseekid.cgi?id=0000109,http://i.imgur.com/2PievAL.png,,http://i.imgur.com/dfklj6J.png,,,,,,,
		004,Alien 8,http://www.worldofspectrum.org/infoseekid.cgi?id=0009302,http://i.imgur.com/YG6LzFw.png,,http://i.imgur.com/ABQS7rL.png,http://i.imgur.com/ASk7DLE.png,,,,,,maybe
		005,Alien Storm,http://www.worldofspectrum.org/infoseek.cgi,http://i.imgur.com/MCHsRFT.png,,http://i.imgur.com/g7pDlZW.gif,,,http://i.imgur.com/JRGhtoP.png,http://i.imgur.com/0CvsrpS.png,,,
		006,Amaurote,http://www.worldofspectrum.org/infoseekid.cgi?id=0000176,http://i.imgur.com/Q19l6ux.png,,http://i.imgur.com/9X8AFzY.png,,http://i.imgur.com/5tGhCdb.jpg,,,,,
		007,ATF,http://www.worldofspectrum.org/infoseekid.cgi?id=0000305,http://i.imgur.com/LySZ8Dk.png,http://i.imgur.com/D0dHyCt.png,,,,,,,,
		008,Atic Atac,http://www.worldofspectrum.org/infoseekid.cgi?id=0009305,http://i.imgur.com/v7Vp9yE.png,,http://i.imgur.com/cqcX2Ot.png,,,,,,,
		009,Back to the Future Part II,http://www.worldofspectrum.org/infoseekid.cgi?id=0000366,http://i.imgur.com/j88tknC.png,,http://i.imgur.com/LtjiFuP.png,,,http://i.imgur.com/HdxcvYN.png,http://i.imgur.com/UW6PJu0.png,,,
		010,Ballooning,http://www.worldofspectrum.org/infoseekid.cgi?id=0000395,http://i.imgur.com/MEKH8Id.png,http://i.imgur.com/U3R5pM7.gif,,,http://i.imgur.com/4GpOgmv.jpg,,,,,
		011,Batman,http://www.worldofspectrum.org/infoseekid.cgi?id=0000438,http://i.imgur.com/u4fYQAN.png,,http://i.imgur.com/64kvGjZ.png,,,,,,,
		012,BC's Quest for Tires,http://www.worldofspectrum.org/infoseekid.cgi?id=0000477,http://i.imgur.com/W0fBQHY.png,,http://i.imgur.com/HQpxbna.png,,,,,,,
		013,Bloody Paws,http://www.worldofspectrum.org/infoseekid.cgi?id=0000595,http://i.imgur.com/hgSMr7F.png,,http://i.imgur.com/mehQmBw.gif,,http://i.imgur.com/XU7MWLA.jpg,,,,,
		014,BMX Ninja,http://www.worldofspectrum.org/infoseekid.cgi?id=0000603,http://i.imgur.com/stbujXH.png,,http://i.imgur.com/VLTmBGT.png,,http://i.imgur.com/E7gsWTe.jpg,,,,,
		015,BMX Simulator,http://www.worldofspectrum.org/infoseekid.cgi?id=0009313,http://i.imgur.com/PtQ7KQg.png,,http://i.imgur.com/tBJ05Tu.png,,,,,,,
		016,Bomb Jack,http://www.worldofspectrum.org/infoseekid.cgi?id=0000617,http://i.imgur.com/da7GSuZ.png,,http://i.imgur.com/AOYCMI5.png,,,http://i.imgur.com/PE0C3Pm.jpg,,,,
		017,Bronx,http://www.worldofspectrum.org/infoseekid.cgi?id=0000714,http://i.imgur.com/F6XKGOz.png,,http://i.imgur.com/qP14Q6G.gif,,,http://i.imgur.com/XEiLFs0.png,,,,
		018,Bruce Lee,http://www.worldofspectrum.org/infoseekid.cgi?id=0000718,http://i.imgur.com/2WvUDkd.png,,http://i.imgur.com/MBQIrBl.png,,,,,,,
		019,Bubble Bobble,http://www.worldofspectrum.org/infoseekid.cgi?id=0000722,http://i.imgur.com/ig0ycrd.png,,http://i.imgur.com/HQYEXLQ.png,,,,,,,
		020,"Bump, Set, Spike!",http://www.worldofspectrum.org/infoseekid.cgi?id=0000762,http://i.imgur.com/htz9Y0r.png,,http://i.imgur.com/ytXP7nY.gif,,,,,,,hard
		021,Cabal,http://www.worldofspectrum.org/infoseekid.cgi?id=0000780,http://i.imgur.com/5QIgTf2.png,,http://i.imgur.com/meqgCoc.png,,,http://i.imgur.com/QWfgcKV.png,,,,
		022,California Games,http://www.worldofspectrum.org/infoseekid.cgi?id=0000790,http://i.imgur.com/UQtfdHF.png,,,,,http://i.imgur.com/QZ0fiJT.gif,,,,
		023,Cauldron,http://www.worldofspectrum.org/infoseekid.cgi?id=0000850,http://i.imgur.com/sUwaZMN.png,,http://i.imgur.com/6u0Ab9R.png,,,http://i.imgur.com/N2716mo.gif,,,,
		024,Ceasefire 2: Night Run,http://www.worldofspectrum.org/infoseekid.cgi?id=0000864,http://i.imgur.com/tgC5Vx4.png,,http://i.imgur.com/u9AycDY.png,,,,,,,
		025,Chase H.Q.,http://www.worldofspectrum.org/infoseekid.cgi?id=0000903,http://i.imgur.com/ZmRm0E4.png,,http://i.imgur.com/wbBoYb4.png,,,http://i.imgur.com/dkDBnox.jpg,http://i.imgur.com/V8Bl4PL.png,,,
		026,Cisco Heat,http://www.worldofspectrum.org/infoseekid.cgi?id=0000968,http://i.imgur.com/tCuVRML.png,http://i.imgur.com/hh3mbRq.png,,,,,,,,
		027,Contact Sam Cruise,http://www.worldofspectrum.org/infoseekid.cgi?id=0001055,http://i.imgur.com/eH3aYfy.png,,http://i.imgur.com/LryobL2.png,,,,,,,
		028,Cookie,http://www.worldofspectrum.org/infoseekid.cgi?id=0009326,http://i.imgur.com/3flcgjK.png,,,,http://i.imgur.com/pcNNm6p.jpg,,,,,
		029,Critical Mass,http://www.worldofspectrum.org/infoseekid.cgi?id=0001158,http://i.imgur.com/61pP84v.png,http://i.imgur.com/gtHRt2b.gif,http://i.imgur.com/KJ0LcnZ.gif,,,,,,,
		030,Cybernoid,http://www.worldofspectrum.org/infoseekid.cgi?id=0001196,http://i.imgur.com/Z7syUTd.png,,,,http://i.imgur.com/PJnTgDV.jpg,,,,,
		031,Cyclone,http://www.worldofspectrum.org/infoseekid.cgi?id=0001206,http://i.imgur.com/C4IlOpa.png,,http://i.imgur.com/wCNaDBr.png,,,,,,http://i.imgur.com/u3AIkub.jpg,
		032,Dizzy,http://www.worldofspectrum.org/infoseekid.cgi?id=0025197,http://i.imgur.com/rcPpiWQ.png,http://i.imgur.com/DS2qlps.gif,,,,,,,,
		033,Double Dragon II: The Revenge,http://www.worldofspectrum.org/infoseekid.cgi?id=0001458,http://i.imgur.com/pNfX78F.png,,,,,http://i.imgur.com/5YjqpDp.png,,,,
		034,Dragon Breed,http://www.worldofspectrum.org/infoseekid.cgi?id=0001486,http://i.imgur.com/Vjo6gh6.png,,,,,http://i.imgur.com/SZj07at.png,http://i.imgur.com/VH6wOsV.png,,,
		035,Endurance,http://www.worldofspectrum.org/infoseekid.cgi?id=0001626,http://i.imgur.com/OSS7ba9.png,,http://i.imgur.com/xTRL3N0.gif,,,,,,,
		036,Enduro Racer,http://www.worldofspectrum.org/infoseekid.cgi?id=0001628,http://i.imgur.com/9Po7Emx.png,,http://i.imgur.com/9mejQeM.png,,,http://i.imgur.com/3UoiWu3.png,,,,
		037A,E-SWAT,http://www.worldofspectrum.org/infoseekid.cgi?id=0001655,http://i.imgur.com/BwQpP7L.png,,,,,http://i.imgur.com/pEssmh9.jpg,,,,
		037B,E-SWAT,http://www.worldofspectrum.org/infoseekid.cgi?id=0001655,http://i.imgur.com/wpR0V7s.png,,,,,http://i.imgur.com/ziLDu9P.png,,,,
		038,Eurorun,http://www.worldofspectrum.org/infoseekid.cgi?id=0021828,http://i.imgur.com/UHAmraH.png,,,,http://i.imgur.com/0C8bZA2.jpg,,,,,
		039,Everyone's a Wally,http://www.worldofspectrum.org/infoseekid.cgi?id=0001677,http://i.imgur.com/UB0Dtxt.png,,http://i.imgur.com/rVcRRIk.gif,,http://i.imgur.com/S14dO2f.jpg,,,,,
		040,Exploding Fist +,http://www.worldofspectrum.org/infoseekid.cgi?id=0005641,http://i.imgur.com/5npcR3R.png,,http://i.imgur.com/0na2mJG.gif,,,http://i.imgur.com/BUFcEjc.png,,,,
		041,Fernando Martin Basket Master,http://www.worldofspectrum.org/infoseekid.cgi?id=0001741,http://i.imgur.com/GCpv0nD.png,,http://i.imgur.com/97ssZin.gif,,,,,,,hard
		042,Final Fight,http://www.worldofspectrum.org/infoseekid.cgi?id=0009344,http://i.imgur.com/4rhaBzy.png,,,,,http://i.imgur.com/NSV3osk.jpg,,,,
		043,FireTrap,http://www.worldofspectrum.org/infoseekid.cgi?id=0001782,http://i.imgur.com/aAZnpW1.png,,http://i.imgur.com/x0Rp6l8.png,,,,,,,
		044,Flying Shark,http://www.worldofspectrum.org/infoseekid.cgi?id=0001813,http://i.imgur.com/zoXPUpf.png,,http://i.imgur.com/8dTdN31.gif,,http://i.imgur.com/RAkaKF7.jpg,http://i.imgur.com/0HCx8lj.jpg,,,,
		045,Formula One,http://www.worldofspectrum.org/infoseekid.cgi?id=0001845,http://i.imgur.com/yuktsDz.png,,http://i.imgur.com/yo6GzaR.gif,,http://i.imgur.com/HvzFXFn.jpg,,,,,
		046,Galaxians,http://www.worldofspectrum.org/infoseekid.cgi?id=0001934,http://i.imgur.com/jHeM5GF.png,,http://i.imgur.com/8DpRaZX.gif,,,http://i.imgur.com/6gg0l2y.png,,,,
		047,Ghostbusters II,http://www.worldofspectrum.org/infoseekid.cgi?id=0002031,http://i.imgur.com/j4qiPIp.png,,,,,http://i.imgur.com/oBKmMw9.png,,,,
		048A,Gremlins,http://www.worldofspectrum.org/infoseekid.cgi?id=0006399,http://i.imgur.com/wdVIbt5.png,,http://i.imgur.com/f3YYUQF.png,,,,,,,
		048B,Gremlins,http://www.worldofspectrum.org/infoseekid.cgi?id=0006399,http://i.imgur.com/EvNXa7w.png,,http://i.imgur.com/f3YYUQF.png,,,,,,,
		050,Handicap Golf,http://www.worldofspectrum.org/infoseekid.cgi?id=0010527,http://i.imgur.com/KUpyQYI.png,,,,http://i.imgur.com/52B6aT4.jpg,,,,,
		051,Head over Heels,http://www.worldofspectrum.org/infoseekid.cgi?id=0002259,http://i.imgur.com/kkBCHRI.png,,http://i.imgur.com/GUlsK2N.png,,,http://i.imgur.com/PijFogu.png,,,,
		052,Hercules: Slayer of the Damned,http://www.worldofspectrum.org/infoseekid.cgi?id=0002299,http://i.imgur.com/kVnIP59.png,,http://i.imgur.com/iKc05zI.gif,,,,,,,
		053,High Noon,http://www.worldofspectrum.org/infoseekid.cgi?id=0002315,http://i.imgur.com/fRxqxyW.png,,http://i.imgur.com/AI1Z9MJ.gif,,,,,,,
		054,Highway Encounter,http://www.worldofspectrum.org/infoseekid.cgi?id=0002323,http://i.imgur.com/PbI9F44.png,,http://i.imgur.com/PfcjVvi.png,,,http://i.imgur.com/TWf7fT3.jpg,,,,
		055,Hijack,http://www.worldofspectrum.org/infoseekid.cgi?id=0002326,http://i.imgur.com/Fr4L3VK.png,,http://i.imgur.com/k25C7dA.gif,,,,,,,
		056,Hopper Copper,http://www.worldofspectrum.org/infoseekid.cgi?id=0002348,http://i.imgur.com/x9JEMsv.png,,http://i.imgur.com/5N6aDrE.png,,http://i.imgur.com/8KcflOv.jpg,,,,,
		057,Howard the Duck,http://www.worldofspectrum.org/infoseekid.cgi?id=0002370,http://i.imgur.com/QPO7hUg.png,,,,http://i.imgur.com/F5Tb5gc.jpg,,,,,
		058,The Hulk,http://www.worldofspectrum.org/infoseekid.cgi?id=0006854,http://i.imgur.com/K1XRJv6.png,,http://i.imgur.com/lPzhvsS.png,,,,,,,
		059,Ikari Warriors,http://www.worldofspectrum.org/infoseekid.cgi?id=0002450,http://i.imgur.com/zRSR3yv.png,,http://i.imgur.com/Y80E99K.gif,,,,,,,
		060,Implosion,http://www.worldofspectrum.org/infoseekid.cgi?id=0002456,http://i.imgur.com/jAvsV07.png,http://i.imgur.com/R86mBV0.png,,,,,,,,
		061,Indiana Jones and the Last Crusade,http://www.worldofspectrum.org/infoseekid.cgi?id=0002473,http://i.imgur.com/iOcIeOk.png,,http://i.imgur.com/IMXXlqy.gif,,,,,,,
		062,Italian Supercar,http://www.worldofspectrum.org/infoseekid.cgi?id=0009360,http://i.imgur.com/p8Xi9RR.png,,http://i.imgur.com/Q5gYHDZ.gif,,,,,,,impossible
		063,Jetpac,http://www.worldofspectrum.org/infoseekid.cgi?id=0009362,http://i.imgur.com/wvTrApA.png,,http://i.imgur.com/yPWSy6g.png,,http://i.imgur.com/MFkIen9.jpg,,,,,
		064,Jungle Warrior,http://www.worldofspectrum.org/infoseekid.cgi?id=0002664,http://i.imgur.com/va6zKGx.png,,http://i.imgur.com/O7rizxk.gif,,,http://i.imgur.com/9lKt9y8.png,,,,
		065,Kickboxing,http://www.worldofspectrum.org/infoseekid.cgi?id=0002691,http://i.imgur.com/TWYUBgb.png,,http://i.imgur.com/AQUHN6k.png,,,,,,,
		066,Knight Lore,http://www.worldofspectrum.org/infoseekid.cgi?id=0009366,http://i.imgur.com/oLLSWRl.png,,http://i.imgur.com/NEgBPfL.png,,,,,,,
		067,Kwah!,http://www.worldofspectrum.org/infoseekid.cgi?id=0006549,http://i.imgur.com/aCm9pw0.png,,,,http://i.imgur.com/w0GQ1cq.jpg,,,,,
		068,Last Ninja 2,http://www.worldofspectrum.org/infoseekid.cgi?id=0002827,http://i.imgur.com/l40EyE4.png,,http://i.imgur.com/6kywtwY.png,,,http://i.imgur.com/qqEIL8F.gif,,,,
		069,Little Puff,http://www.worldofspectrum.org/infoseekid.cgi?id=0009371,http://i.imgur.com/ZHUFN06.png,,http://i.imgur.com/Lm9WVNw.gif,,,,,,,
		070,The Lords of Midnight,http://www.worldofspectrum.org/infoseekid.cgi?id=0006604,http://i.imgur.com/SOt2764.png,,http://i.imgur.com/9VBMGV9.gif,,,,,,,
		071,Lotus Esprit Turbo Challenge,http://www.worldofspectrum.org/infoseekid.cgi?id=0002937,http://i.imgur.com/wDZVqJe.png,,http://i.imgur.com/9pgy19a.png,,,,,,http://i.imgur.com/LFQVwvD.jpg,
		072,Lunar Jetman,http://www.worldofspectrum.org/infoseekid.cgi?id=0009372,http://i.imgur.com/LnmVcD8.png,,http://i.imgur.com/6wt6HxK.gif,,http://i.imgur.com/RGCVf6U.jpg,,,,,
		073A,Manic Miner,http://www.worldofspectrum.org/infoseekid.cgi?id=0003012,http://i.imgur.com/sYbTLKw.png,,http://i.imgur.com/PJCSR00.gif,,http://i.imgur.com/BkyKeqO.jpg,,,,,
		073B,Manic Miner,http://www.worldofspectrum.org/infoseekid.cgi?id=0003012,http://i.imgur.com/lfj4Pvd.png,,http://i.imgur.com/lJC98x0.jpg,,,,,,,
		075,Marsport,http://www.worldofspectrum.org/infoseekid.cgi?id=0003040,http://i.imgur.com/AR5yYPX.png,,http://i.imgur.com/FMuOE0z.gif,,,,,,,
		076,Match Day,http://www.worldofspectrum.org/infoseekid.cgi?id=0003067,http://i.imgur.com/x599zEa.png,,http://i.imgur.com/rxPEZWh.png,,,,,,,
		077,Match Point,http://www.worldofspectrum.org/infoseekid.cgi?id=0003074,http://i.imgur.com/H0lktTd.png,,http://i.imgur.com/DaTC1di.png,,,,,,,
		078A,Midnight Resistance,http://www.worldofspectrum.org/infoseekid.cgi?id=0003188,http://i.imgur.com/XHYaSPK.png,,,,,http://i.imgur.com/Vt3EUWy.png,,,,
		078B,Midnight Resistance,http://www.worldofspectrum.org/infoseekid.cgi?id=0003188,http://i.imgur.com/HGqdG58.png,,http://i.imgur.com/qCFsHi5.png,,,,,,,
		080,Movie,http://www.worldofspectrum.org/infoseekid.cgi?id=0003300,http://i.imgur.com/iheHUh1.png,,http://i.imgur.com/vaYq2Yw.png,,,,,,,
		081,Nebulus,http://www.worldofspectrum.org/infoseekid.cgi?id=0003377,http://i.imgur.com/I8vIzOJ.png,,http://i.imgur.com/CaNTqoD.gif,,,http://i.imgur.com/4O4wchS.gif,,,,
		082A,Nether Earth,http://www.worldofspectrum.org/infoseekid.cgi?id=0003391,http://i.imgur.com/ofNEpi9.png,,http://i.imgur.com/0n5lKJ1.png,http://i.imgur.com/sz0EtwS.png,,,,,,
		082B,Nether Earth,http://www.worldofspectrum.org/infoseekid.cgi?id=0003391,http://i.imgur.com/TsFRIAC.png,,http://i.imgur.com/sz0EtwS.png,http://i.imgur.com/0n5lKJ1.png,,,,,,
		084,Out Run,http://www.worldofspectrum.org/infoseekid.cgi?id=0003563,http://i.imgur.com/SyYflgi.png,http://i.imgur.com/QgLYUE4.gif,,,,,,,,
		085,Ping Pong,http://www.worldofspectrum.org/infoseekid.cgi?id=0003722,http://i.imgur.com/bNh0HZI.png,,http://i.imgur.com/R5eb7fk.gif,,,,,,,
		086,Popeye,http://www.worldofspectrum.org/infoseekid.cgi?id=0003830,http://i.imgur.com/s10qqkp.png,,http://i.imgur.com/dan88MI.png,,,,,,,
		087,Psi Chess,http://www.worldofspectrum.org/infoseekid.cgi?id=0003911,http://i.imgur.com/MkUVSFn.png,http://i.imgur.com/eRq74wE.gif,,,,,,,,
		088,Pssst,http://www.worldofspectrum.org/infoseekid.cgi?id=0009401,http://i.imgur.com/Yjum30g.png,,http://i.imgur.com/AMXLSYN.gif,,http://i.imgur.com/WWbcTq8.jpg,,,,,
		089,Psycho City,http://www.worldofspectrum.org/infoseekid.cgi?id=0003916,http://i.imgur.com/2EOBs62.png,,http://i.imgur.com/6U1tNqP.gif,,,,,,,
		090,Rainbow Islands,http://www.worldofspectrum.org/infoseekid.cgi?id=0000724,http://i.imgur.com/oc92DYt.png,http://i.imgur.com/PV8DMve.gif,http://i.imgur.com/50WaNDR.png,,,,,,,
		091,Renegade,http://www.worldofspectrum.org/infoseekid.cgi?id=0004082,http://i.imgur.com/NoYtYLj.png,,http://i.imgur.com/9RoQjtj.png,,,,,,,
		092,Road Blasters,http://www.worldofspectrum.org/infoseekid.cgi?id=0004157,http://i.imgur.com/F2pb2Hg.png,,http://i.imgur.com/WEBjX1o.png,,,http://i.imgur.com/kwDL7DM.png,,,,
		093,Roadrunner,http://www.worldofspectrum.org/infoseekid.cgi?id=0004162,http://i.imgur.com/rg8gYKD.png,,,,,http://i.imgur.com/EtPrmAs.png,,,,
		094,RoboCop,http://www.worldofspectrum.org/infoseekid.cgi?id=0004179,http://i.imgur.com/Rf4kGJg.png,,,,,http://i.imgur.com/5BaMfEq.png,,,,
		095,R-Type,http://www.worldofspectrum.org/infoseekid.cgi?id=0004256,http://i.imgur.com/9OQGVsR.png,,http://i.imgur.com/R7SohQ0.png,,,http://i.imgur.com/uimGQt3.jpg,,,,
		096A,Saboteur!,http://www.worldofspectrum.org/infoseekid.cgi?id=0004293,http://i.imgur.com/vNChhbP.png,,http://i.imgur.com/0MK7wiN.png,,,,,,,
		096B,Saboteur!,http://www.worldofspectrum.org/infoseekid.cgi?id=0004293,http://i.imgur.com/jLqtLgs.png,,http://i.imgur.com/Ydqvmt3.png,,,,,,,
		098,Scuba Dive,http://www.worldofspectrum.org/infoseekid.cgi?id=0004381,http://i.imgur.com/5tznoxZ.png,,http://i.imgur.com/T13RkMn.png,,http://i.imgur.com/DuD8JRi.jpg,,,,,
		099,Sim City,http://www.worldofspectrum.org/infoseekid.cgi?id=0004509,http://i.imgur.com/Waz6AOn.png,,,,,http://i.imgur.com/gzB1JGQ.gif,,,,
		100,Skool Daze,http://www.worldofspectrum.org/infoseekid.cgi?id=0004549,http://i.imgur.com/hWfAxBK.png,,http://i.imgur.com/hRGTxZM.png,,,,,,,
		101A,Sly Spy: Secret Agent,http://www.worldofspectrum.org/infoseekid.cgi?id=0004574,http://i.imgur.com/gPZdBfz.png,,http://i.imgur.com/HEd6yNg.png,,,,,,,
		101B,Sly Spy: Secret Agent,http://www.worldofspectrum.org/infoseekid.cgi?id=0004574,http://i.imgur.com/tYzhmmP.png,,,,,http://i.imgur.com/IHm9T71.png,,,,
		103,Spy vs Spy,http://www.worldofspectrum.org/infoseekid.cgi?id=0004786,http://i.imgur.com/T11oYJX.png,,http://i.imgur.com/JeDG67P.png,,,,,,,
		104,Stop the Express,http://www.worldofspectrum.org/infoseekid.cgi?id=0004916,http://i.imgur.com/AtQMXNk.png,,http://i.imgur.com/oaYrWxE.png,,http://i.imgur.com/nz2y2gB.jpg,,,,,
		105,Stunt Car Racer,http://www.worldofspectrum.org/infoseekid.cgi?id=0004969,http://i.imgur.com/LEyrUWN.png,http://i.imgur.com/ZN8aL5n.png,,,,,,,,
		106,Summer Games,http://www.worldofspectrum.org/infoseek.cgi,http://i.imgur.com/VOf5wqe.png,,http://i.imgur.com/B7GLr5b.png,,,,,,,
		107,Super Hang-On,http://www.worldofspectrum.org/infoseekid.cgi?id=0005019,http://i.imgur.com/fHe8DMo.png,,http://i.imgur.com/8NfJF0J.png,,,,,,,
		108,T.L.L.,http://www.worldofspectrum.org/infoseekid.cgi?id=0005302,http://i.imgur.com/8MYXGDf.png,,http://i.imgur.com/0W35fNh.gif,,,,,,,
		109,Through the Trap Door,http://www.worldofspectrum.org/infoseekid.cgi?id=0005390,http://i.imgur.com/h38zsjp.png,,http://i.imgur.com/lcYA3tu.jpg,,,,,,,
		110,Trashman,http://www.worldofspectrum.org/infoseekid.cgi?id=0005391,http://i.imgur.com/J5Glbz6.png,,http://i.imgur.com/on7a9Ie.png,,,,,,,
		111,Turbo Cup,http://www.worldofspectrum.org/infoseekid.cgi?id=0005458,http://i.imgur.com/UCU6xK8.png,,http://i.imgur.com/HAnMUJL.png,,,http://i.imgur.com/NgdBXq9.png,,,,
		112,Turrican,http://www.worldofspectrum.org/infoseekid.cgi?id=0005472,http://i.imgur.com/fNgrNev.png,,http://i.imgur.com/iQV1qoW.png,,,,,,,
		113,Uridium,http://www.worldofspectrum.org/infoseekid.cgi?id=0005525,http://i.imgur.com/ZbB9l9N.png,http://i.imgur.com/5dHtOXV.png,,,,,,,,
		114,WEC Le Mans,http://www.worldofspectrum.org/infoseekid.cgi?id=0005648,http://i.imgur.com/AlU5Pxz.png,http://i.imgur.com/jU3fbic.png,,,,http://i.imgur.com/ZFyWqnd.gif,,,,
		115,Wibstars,http://www.worldofspectrum.org/infoseekid.cgi?id=0005681,http://i.imgur.com/ZY2cioH.png,,,,,http://i.imgur.com/eu7etOv.png,,,,
	"""
	gamesCsv = gamesCsv.split(/\r\n|\n/)

	# Use this csv to
	#	 1. store the id: game name association
	games = {}

	#	 2. generate the game lists for users
	listofGames = {}

	# Some of the games have 2 associated polygons, to avoid duplication,
	# we'll use listofIds to track when we've already accounted for a game
	listofIds = []
	userList = document.createDocumentFragment()

	gamesCsv.forEach (game) ->
		# Split each row of the csv into its values
		# This regex filters and ignores escaped commas (csv uses "" to escape)
		values = game.split(/,(?=(?:[^"]*"[^"]*")*[^"]*$)/)

		# This leaves the "" in those values, so we'll filter those out in the name
		name = values[1].replace(/"/g, "")

		# Generate id by filtering out alpha characters, which were included for polygonId
		id = values[0].replace(/[A-Za-z]/g, "")

		# Create the game object
		games[values[0]] =
			name: name
			id: id
			WoS: values[2]
			crop: values[3] || null
			loading: values[4] || null
			screen1: values[5] || null
			screen2: values[6] || null
			inlay: values[7] || null
			arcade1: values[8] || null
			arcade2: values[9] || null
			arcade3: values[10] || null
			photo: values[11] || null

		# Using the id to check for duplicates, create the list of games
		if listofIds.indexOf(id) is -1
			listofIds.push(id)
			# Slugify the title in list of games so we can match it more easily later
			listofGames[id] = [name, name.toLowerCase().replace(/[^\w ]+/g,'').replace(/ +/g,'-')]

			# Also append the elements to the document fragment to add to DOM later
			gameSelection = document.createElement('li')
			gameSelection.textContent = name
			gameSelectionId = document.createAttribute('data-gameid')
			gameSelectionId.value = id
			gameSelection.setAttributeNode(gameSelectionId)
			gameSelectionClass = document.createAttribute('class')
			gameSelectionClass.value = 'game-selection'
			gameSelection.setAttributeNode(gameSelectionClass)

			userList.appendChild(gameSelection)

	# The list of games appears in 2 places: the main menu and in the game selection
	# Duplicate userList and append both fragments
	guessList = userList.cloneNode(true)

	document.getElementsByClassName('all-games')[0].appendChild(userList)
	document.getElementsByClassName('all-games')[1].appendChild(guessList)

	# Store the games in sessionStorage for interactive features later
	sessionStorage.games = JSON.stringify(games)
	sessionStorage.listofGames = JSON.stringify(listofGames)










	# Pulled a list of polygon points from the editor, use it to generate all the polygons
	polygons = [
    {
      "id": "001",
      "polygon": ["70,21 69,21 68,23 69,25 70,25 70,26 71,26 71,23"]
    }, {
      "id": "002",
      "polygon": ["19,51 13,55 16,61 17,60 18,61 22,58 22,53 19,53"]
    }, {
      "id": "003",
      "polygon": ["73,49 75,47 77,50 74,52 73,51 "]
    }, {
      "id": "004",
      "polygon": ["46,81 43,83 44,86 45,86 45,89 48,87 49,89 51,87 50,84 48,85"]
    }, {
      "id": "005",
      "polygon": ["0,5 2,4 4,8 5,13 0,17"]
    }, {
      "id": "006",
      "polygon": ["34,80 25,86 21,77 23,74 28,72 29,75 30,77 31,78"]
    }, {
      "id": "007",
      "polygon": ["77,88 77,88 69,87 69,91 70,95 72,97 73,97"]
    }, {
      "id": "008",
      "polygon": ["6,21 10,23 10,26 5,24"]
    }, {
      "id": "009",
      "polygon": ["88,32 95,48 91,50 85,35 88,32 95,48 91,49 85,35 89,33 95,48"]
    }, {
      "id": "010",
      "polygon": ["0,27 4,27 7,31 7,36 4,46 0,48"]
    }, {
      "id": "011",
      "polygon": ["37,76 39,75 42,83 40,85"]
    }, {
      "id": "012",
      "polygon": ["62,96 64,95 66,99 64,100"]
    }, {
      "id": "013",
      "polygon": ["94,7 99,5 97,0 93,3"]
    }, {
      "id": "014",
      "polygon": ["71,53 73,51 74,53 72,55"]
    }, {
      "id": "015",
      "polygon": ["82,78 84,78 86,80 95,73 92,65 98,61 100,66 100,79 99,78 95,81 95,83 94,83 92,82 85,86 85,89 84,89 83,88 81,83 81,80"]
    }, {
      "id": "016",
      "polygon": ["83,77 81,71 89,66 90,68 88,78 86,79"]
    }, {
      "id": "017",
      "polygon": ["84,12 88,13 89,16 85,17"]
    }, {
      "id": "018",
      "polygon": ["80,29 84,30 85,33 80,33 80,30 80,30 80,30 80,30"]
    }, {
      "id": "019",
      "polygon": ["2,66 2,61 4,61 6,62 6,64 7,65 7,67 6,68 5,68 5,67"]
    }, {
      "id": "020",
      "polygon": ["81,52 84,50 85,52 88,49 89,51 85,54 84,52 81,54"]
    }, {
      "id": "021",
      "polygon": ["75,65 79,63 81,69 77,71"]
    }, {
      "id": "022",
      "polygon": ["78,50 81,49 88,43 87,41 84,43 80,38 79,38 79,40 79,42"]
    }, {
      "id": "023",
      "polygon": ["35,51 39,57 41,55 42,49 39,45"]
    }, {
      "id": "024",
      "polygon": ["11,82 15,76 17,75 18,78 18,79 17,80 12,84"]
    }, {
      "id": "025",
      "polygon": ["32,14 36,10 39,10 42,20 44,22 43,25 43,28 41,33 39,34"]
    }, {
      "id": "026",
      "polygon": ["29,75 31,78 34,75 34,74 33,72 33,72 33,72 32,73 30,74 "]
    }, {
      "id": "027",
      "polygon": ["80,13 82,11 86,21 86,31 85,32 83,27 71,36 71,41 65,45 63,40 62,40 61,38 59,38 59,24 62,33 62,34 64,32 64,31 70,27 71,28 72,27 70,19 73,18 77,27 77,25 82,21 83,21"]
    }, {
      "id": "028",
      "polygon": ["35,61 39,58 41,62 42,63 41,64 40,68 37,69"]
    }, {
      "id": "029",
      "polygon": ["5,27 6,25 8,26 9,27 10,29 8,30 7,30 5,28"]
    }, {
      "id": "030",
      "polygon": ["21,8 24,3 30,3 31,7 32,17 33,20 34,20 36,26 36,31 24,39"]
    }, {
      "id": "031",
      "polygon": ["84,95 85,86 92,82 97,86 98,87 97,90 94,98 89,99"]
    }, {
      "id": "032",
      "polygon": ["48,64 50,64 51,67 49,68"]
    }, {
      "id": "033",
      "polygon": ["64,31 69,27 68,26 67,26 65,26 63,27"]
    }, {
      "id": "034",
      "polygon": ["72,74 79,71 81,77 81,84 80,84 79,84 73,80"]
    }, {
      "id": "035",
      "polygon": ["94,38 96,36 98,40 95,42"]
    }, {
      "id": "036",
      "polygon": ["88,31 90,30 91,33 89,33"]
    }, {
      "id": "037A",
      "polygon": ["0,66 0,76 3,76 5,76 6,74 5,70 4,67 3,66"]
    }, {
      "id": "037B",
      "polygon": ["93,55 97,53 100,55 99,57 95,59"]
    }, {
      "id": "038",
      "polygon": ["100,56 98,58 98,60 100,61"]
    }, {
      "id": "039",
      "polygon": ["14,38 11,39 13,42 14,41"]
    }, {
      "id": "040",
      "polygon": ["8,62 11,62 12,63 12,65 8,65"]
    }, {
      "id": "041",
      "polygon": ["35,80 26,86 30,100 35,100 35,95 33,96 32,93 34,91 35,88"]
    }, {
      "id": "042",
      "polygon": ["15,0 22,0 23,3 19,6 16,5"]
    }, {
      "id": "043",
      "polygon": ["56,34", "50,36", "47,31", "47,12", "49,10", "49,7", "50,6", "51,8", "54,10", "55,15", "56,18"]
    }, {
      "id": "044",
      "polygon": ["36,98 39,96 38,88 35,89 32,92 32,94 33,96 34,95 35,94"]
    }, {
      "id": "045",
      "polygon": ["54,55 55,59 59,56 59,53 58,53"]
    }, {
      "id": "046",
      "polygon": ["8,9 12,6 11,0 6,0 6,1 6,2 6,6"]
    }, {
      "id": "047",
      "polygon": ["89,77 94,73 91,66 89,73 89,76"]
    }, {
      "id": "048A",
      "polygon": ["57,21 58,21 58,24 57,24"]
    }, {
      "id": "048B",
      "polygon": ["95,44 97,44 97,46 95,46"]
    }, {
      "id": "050",
      "polygon": ["41,67 44,67 43,63 42,63 41,64"]
    }, {
      "id": "051",
      "polygon": ["46,76 51,73 52,77 52,81 48,84"]
    }, {
      "id": "052",
      "polygon": ["81,54 83,59 86,59 86,56 85,54 84,54"]
    }, {
      "id": "053",
      "polygon": ["20,77 19,73 21,69 22,68 22,71 22,76"]
    }, {
      "id": "054",
      "polygon": ["39,35 43,33 45,40 44,42 45,46 46,50 47,50 49,52 50,52 51,55 53,60 50,63 47,55 46,56 39,36"]
    }, {
      "id": "055",
      "polygon": ["42,83 46,81 46,77 45,73 42,75 42,76 41,77 40,78"]
    }, {
      "id": "056",
      "polygon": ["8,36 10,35 11,38 9,39"]
    }, {
      "id": "057",
      "polygon": ["44,25 46,25 46,28 46,29 44,29"]
    }, {
      "id": "058",
      "polygon": ["95,59 97,58 98,61 96,62"]
    }, {
      "id": "059",
      "polygon": ["30,99 28,93 26,94 28,99"]
    }, {
      "id": "060",
      "polygon": ["57,62 56,64 56,70 55,74 55,75 56,78 59,77 62,83 63,83 65,81 63,74 66,70 65,67 61,65"]
    }, {
      "id": "061",
      "polygon": ["96,11 97,7 96,6 94,8"]
    }, {
      "id": "062",
      "polygon": ["73,44 72,44 72,45 72,47 73,46"]
    }, {
      "id": "063",
      "polygon": ["30,0 47,0 50,6 49,7 49,10 47,11 46,18 43,20 39,10 36,10 32,13"]
    }, {
      "id": "064",
      "polygon": ["100,7 100,12 97,12 96,10 97,9"]
    }, {
      "id": "065",
      "polygon": ["89,51 91,51 91,54 89,54 89,52"]
    }, {
      "id": "066",
      "polygon": ["38,88 43,84 45,89 44,90 44,92 41,95"]
    }, {
      "id": "067",
      "polygon": ["97,85 98,86 99,84 99,81 98,81 97,82"]
    }, {
      "id": "068",
      "polygon": ["90,21 92,20 93,22 93,25 91,26"]
    }, {
      "id": "069",
      "polygon": ["64,24 67,22 69,25 68,26 64,26"]
    }, {
      "id": "070",
      "polygon": ["86,18 89,17 91,21 89,22 87,21"]
    }, {
      "id": "071",
      "polygon": ["16,87 12,89 13,92 15,92 16,90 17,89"]
    }, {
      "id": "072",
      "polygon": ["71,42 66,45 68,49 69,49 72,47 72,44"]
    }, {
      "id": "073A",
      "polygon": ["11,60 13,59 14,62 12,62 11,62 10,62"]
    }, {
      "id": "073B",
      "polygon": ["4,7 5,10 7,10 6,6 6,0 4,0"]
    }, {
      "id": "075",
      "polygon": ["12,48 14,51 11,53 10,52 10,49"]
    }, {
      "id": "077",
      "polygon": ["69,57 79,50 83,59 80,61 79,60 74,63 74,65 72,67 71,65 71,62"]
    }, {
      "id": "078A",
      "polygon": ["13,45 16,49 21,45 22,41 20,40 17,41"]
    }, {
      "id": "078B",
      "polygon": ["68,4 71,2 73,8 69,12 69,17 59,25 56,16 56,14 58,13 58,11"]
    }, {
      "id": "080",
      "polygon": ["45,73 49,70 49,68 51,67 52,70 51,73 46,76"]
    }, {
      "id": "081",
      "polygon": ["92,53 94,51 95,54 93,55"]
    }, {
      "id": "084",
      "polygon": ["16,93 20,90 19,87 15,90"]
    }, {
      "id": "085",
      "polygon": ["84,61 91,56 94,63 90,66 89,65 86,67 84,62"]
    }, {
      "id": "086",
      "polygon": ["53,8 55,8 57,9 57,11 56,12 54,12"]
    }, {
      "id": "087",
      "polygon": ["85,54 87,59 89,58 89,54 89,53 87,52"]
    }, {
      "id": "088",
      "polygon": ["76,44 79,42 79,38 80,38 80,35 77,32 75,35 75,40"]
    }, {
      "id": "089",
      "polygon": ["94,31 96,30 94,25 92,26 92,28 93,31"]
    }, {
      "id": "090",
      "polygon": ["0,56 4,52 7,54 10,56 11,59 7,62 4,59 2,60 1,62 1,64 1,65 0,65"]
    }, {
      "id": "091",
      "polygon": ["12,100 13,96 20,91 23,100"]
    }, {
      "id": "092",
      "polygon": ["91,37 93,36 94,41 93,42 92,40"]
    }, {
      "id": "093",
      "polygon": ["77,100 81,99 81,94 77,95"]
    }, {
      "id": "094",
      "polygon": ["82,4 87,4 88,7 87,8 84,10 82,9"]
    }, {
      "id": "095",
      "polygon": ["16,62 21,59 26,61 25,65 23,67 20,69 19,68"]
    }, {
      "id": "096A",
      "polygon": ["55,0 58,0 58,4 56,4 55,2"]
    }, {
      "id": "096B",
      "polygon": ["88,5 92,12 91,13 87,11"]
    }, {
      "id": "098",
      "polygon": ["48,0 49,4 51,4 54,7 57,5 55,2 54,0"]
    }, {
      "id": "099",
      "polygon": ["0,94 3,92 3,98 13,92 13,100 0,100"]
    }, {
      "id": "100",
      "polygon": ["2,76 9,76 9,80 7,81 7,83 7,84 6,84 3,84"]
    }, {
      "id": "101A",
      "polygon": ["22,47 27,44 28,47 28,49 27,55 25,55"]
    }, {
      "id": "101B",
      "polygon": ["58,2 60,2 61,5 60,6 59,7 57,8 56,8 56,8 55,8 55,6 56,5 58,4"]
    }, {
      "id": "103",
      "polygon": ["52,100 52,97 53,97 57,97 58,100"]
    }, {
      "id": "104",
      "polygon": ["25,100 15,70 17,69 21,80 22,80 22,82 25,90 26,92 26,94 28,100"]
    }, {
      "id": "105",
      "polygon": ["57,50 59,49 57,43 56,44 56,48"]
    }, {
      "id": "106",
      "polygon": ["2,89 8,84 10,84 13,92 3,98 3,92"]
    }, {
      "id": "107",
      "polygon": ["7,32 9,34 11,32 10,30 9,30"]
    }, {
      "id": "108",
      "polygon": ["93,22 99,23 100,19 100,16 98,15 96,14"]
    }, {
      "id": "109",
      "polygon": ["40,77 39,73 40,71 41,74 42,75 42,76 41,77"]
    }, {
      "id": "110",
      "polygon": ["86,23 87,22 88,22 89,23 90,27 88,29"]
    }, {
      "id": "111",
      "polygon": ["68,50 71,48 72,50 72,51 69,53"]
    }, {
      "id": "112",
      "polygon": ["98,12 100,12 100,15 98,15"]
    }, {
      "id": "113",
      "polygon": ["45,38 47,36 49,38 51,39 52,40 52,41 53,44 53,48 54,53 54,55 55,56 54,58 53,59 52,59 50,52 49,52 47,50 46,50 44,42 45,41"]
    }, {
      "id": "114",
      "polygon": ["56,42 58,40 59,42 59,46 58,46 57,44 57,44"]
    }, {
      "id": "115",
      "polygon": ["29,70 34,66 35,68 35,72 32,73 31,73"]
    }
  ]

	# Use this list of polygons to generate the interactive polygons in svg
	allPolygons = document.createDocumentFragment()
	polygons.forEach (polygon) ->
		newPolygon = document.createElementNS("http://www.w3.org/2000/svg",'polygon')

		polygonPoints = document.createAttribute('points')
		polygonPoints.value = polygon.polygon
		newPolygon.setAttributeNode(polygonPoints)

		polygonGameId = document.createAttribute('data-gameid')
		polygonGameId.value = polygon.id

		# All ids should be 3 charaacters, unless there are 2 polygons associated
		# with a game, in which case it should have 4 characters
		# In these cases, create a data-polygonid for the polygon
		if polygon.id.length is 4
			polygonId = polygon.id
			id = polygon.id.replace(/[A-Za-z]/g, "")
			polygonPolygonId = document.createAttribute('data-polygonid')
			polygonPolygonId.value = polygonId
			newPolygon.setAttributeNode(polygonPolygonId)

			polygonGameId.value = id

		newPolygon.setAttributeNode(polygonGameId)

		# Set the tooltip
		polygonTooltip = document.createAttribute('class')
		polygonTooltip.value = 'tooltip'
		polygonTooltipTitle = document.createAttribute('title')
		polygonTooltipTitle.value = '???'
		newPolygon.setAttributeNode(polygonTooltip)
		newPolygon.setAttributeNode(polygonTooltipTitle)

		allPolygons.appendChild(newPolygon)

	$(allPolygons).insertAfter('svg > image')










	# Set total game count for progress indicator
	$('.progress__total').text(listofIds.length)

	# Load game progress if it exists
	if localStorage.spectropolisStatus
		count = 0
		progress = JSON.parse(localStorage.spectropolisStatus)
		progress.filter (game) ->
			for key of game
				if game[key]
					# Increment the count of games found
					count++

					# For each game, set the polygon to found
					$('svg > [data-gameid="' + key + '"]').addClass('found').attr('title', listofGames[key][0])

					# Also set the games in the searchc list to found
					$('.game-menu__list-of-games [data-gameid="' + key + '"]').addClass('found')

		# Set the count
		$('.progress__number').text(count)
	else
		# Start the game
		gameProgress = []
		for game of listofGames
			newGame = {}
			newGame[game] = false
			gameProgress.push(newGame)
		localStorage.spectropolisStatus = JSON.stringify(gameProgress)










	# Set draggable image
	$('.spectropolis__wrapper').draggable()

	# Set up game name filtering
	jets = new Jets({
		searchTag: '.guess-game .all-games__search',
		contentTag: '.guess-game ul'
	});










# On mouseover of the polygon, generate a tooltip
$('body').on 'mouseenter', 'svg > polygon', (e) ->
	generateToolTip(e)

# Remove the tooltip on mouseleave of its parent polygon
$('body').on 'mouseleave', 'svg > polygon', (e) ->
	destroyToolTip()

# If dragging, destroy the tooltip
$('body').on 'mousemove', (e) ->
	if $('.object-tooltip').length and $('.ui-draggable-dragging').length
		destroyToolTip()

generateToolTip = (e) ->
	# Check where the polygon is so we can position the tooltip around it
	elementPositionTop = $(e.currentTarget).offset()

	# Also get polygon dimesions so we can adjust the positioning from the origin
	elementWidth = e.currentTarget.getBoundingClientRect().width
	elementHeight = e.currentTarget.getBoundingClientRect().height

	tooltipTop = elementPositionTop.top
	# Left should be half of the polygon width for transformX(-50%)
	tooltipLeft = elementPositionTop.left + (elementWidth/2)

	# Collect classes to determine how to position tooltip
	toolTipClass = document.createAttribute('class')
	toolTipClass.value = 'object-tooltip'

	# If the element is too close to the top, the tooltip should appear below the polygon
	if tooltipTop/window.innerHeight < 0.1
		tooltipTop += elementHeight
		toolTipClass.value += ' position--bottom'
	else
		toolTipClass.value += ' position--top'
	# if the element is too close to the left edge, we ertically center/push right
	if tooltipLeft/window.innerWidth < 0.1
		tooltipLeft = elementPositionTop.left + elementWidth
		tooltipTop = elementPositionTop.top + (elementHeight/2)
		toolTipClass.value += ' position--left'
	# likewise, if the element is too close to the right edge, we should vertically center/push left
	else if tooltipLeft/window.innerWidth > 0.9
		toolTipClass.value += ' position--right'
		tooltipTop = elementPositionTop.top + (elementHeight/2)
		tooltipLeft = elementPositionTop.left

	# Append the new tooltip
	newTooltip = document.createElement('div')
	newTooltip.setAttributeNode(toolTipClass)
	newTooltipContent = document.createTextNode(e.currentTarget.getAttribute('title'))
	newTooltip.appendChild(newTooltipContent)
	document.getElementsByTagName('body')[0].appendChild(newTooltip)
	# Then position it
	$('.object-tooltip').css({left: tooltipLeft, top: tooltipTop})

destroyToolTip = () ->
	$('.object-tooltip').remove()









# On click of a polygon for a game that hasn't been discovered yet
$('body').on 'click', 'svg > polygon:not(.found)', (e) ->
	# Prevent any odd doubling up on 'finding' states
	$('.finding').removeClass('finding')
	$('.references__container').remove()
	$('.get-hint').empty()

	# Clear the form
	$('.all-games__search').val('').bind()

	# Mark polygon as trying to find
	$(e.currentTarget).addClass('finding')

	# Generate the hint screenshot
	# Get the game id
	gameId = $(e.currentTarget).attr('data-polygonid') or $(e.currentTarget).attr('data-gameid')
	game = JSON.parse(sessionStorage.games)[gameId]

	# Create wrapper
	screenshotWrapper = document.createElement('div')
	screenshotWrapperClass = document.createAttribute('class')
	screenshotWrapperClass.value = 'references__container'
	screenshotWrapper.setAttributeNode(screenshotWrapperClass)

	for img in ['crop', 'loading', 'screen1', 'screen2', 'inlay', 'arcade1', 'arcade2', 'arcade3', 'photo']
		if game[img]
			# Use it to pull the screenshot
			image = document.createElement('img')
			imgSrc = document.createAttribute('src')
			imgSrc.value = game[img]
			imgClass = document.createAttribute('class')
			imgClass.value = 'reference--' + img
			image.setAttributeNode(imgSrc)
			image.setAttributeNode(imgClass)

			# Append the screenshot to a wrapper in the body
			screenshotWrapper.appendChild(image)
			document.getElementsByTagName('body')[0].appendChild(screenshotWrapper)

			# Also append a button so we can toggle between hints
			button = document.createElement('button')
			buttonTrigger = document.createAttribute('class')
			buttonTrigger.value = 'reference-toggle'
			buttonHint = document.createAttribute('data-hint')
			buttonHint.value = img
			button.setAttributeNode(buttonTrigger)
			button.setAttributeNode(buttonHint)
			buttonContent = document.createTextNode('hint: ' + img)
			button.appendChild(buttonContent)
			document.getElementsByClassName('get-hint')[0].appendChild(button)

	# Position the screenshot on the polygon and then expand it
	elementOffset = $(e.currentTarget).offset()
	elementLeft = elementOffset.left + e.currentTarget.getBoundingClientRect().width/2
	elementTop = elementOffset.top +	e.currentTarget.getBoundingClientRect().height/2
	$('.references__container').css({left: elementLeft, top: elementTop})
	# Some time for css to kick in
	setTimeout ( ->
		$('.references__container').addClass('expand')
		$('.references__container').attr('data-hint', 'crop')
		# set body state
		$('body').attr('data-state','finding')
	), 10

# Toggle references on button click
$('body').on 'click', '.reference-toggle', (e) ->
	$('.references__container').attr('data-hint', $(e.currentTarget).attr('data-hint'))

# Drop down the games list on focus
$('body').on 'focus click', '.all-games__search', () ->
	$('.guess-game .all-games').slideDown()

# Hide it when off focus
$('body').on 'blur', '.all-games__search', () ->
	$('.guess-game .all-games').slideUp()

# Ability to select from the dropdown
$('body').on 'click', '.guess-game .game-selection', (e) ->
	e.stopPropagation()
	guess = $(e.currentTarget).text()
	$('.all-games__search').val(guess).bind()
	$('.guess-game').submit()

# Validate game guess
$('body').on 'submit', '.guess-game', (e) ->
	# Stop actual submission
	e.preventDefault()

	# Slugify guess to compare to our list
	guess = $('.all-games__search').val().toLowerCase().replace(/[^\w ]+/g,'').replace(/ +/g,'-')

	# Record what game user is guessing
	answer = $('polygon.finding').attr('data-gameid')

	# Compare the slugified guess and see if it matches an id and then an answer
	games = JSON.parse(sessionStorage.listofGames)
	for gameId of games
		if games[gameId][1] is guess
			guess = gameId
	if guess is answer
		loadGameInfoState(answer, true)
	else
		alert "you didn't do it :("

# On click of a polygon for a game that's already been discovered
$('body').on 'click', 'svg > polygon.found', (e) ->
	gameId = e.currentTarget.getAttribute('data-gameid')
	loadGameInfoState(gameId,false)

# On click of a game selector for a game you've already found
$('body').on 'click', '.game-menu__list-of-games .game-selection.found', (e) ->
	gameId = $(e.currentTarget).attr('data-gameid')
	loadGameInfoState(gameId,false)

# Load the game info state from one of two pathways
# insantiate through loadGameInfoState(gameId, fromGameSearch)
# 1. Successfully found game (fromGameSearch = true)
# 2. View already found game (fromGameSearch = false)
loadGameInfoState = (gameId, fromGameSearch) ->
	progress = JSON.parse(localStorage.spectropolisStatus)
	games = JSON.parse(sessionStorage.listofGames)
	progress.filter (game) ->
		for key of game
			# If game hasn't been found yet, set it to found
			if +key is +gameId and game[key] is false
				game[key] = true
				localStorage.spectropolisStatus = JSON.stringify(progress)

				# Update the found count
				count = +$('.progress__number').text() + 1
				$('.progress__number').text(count)

				# Update the polygon
				$('[data-gameid="' + gameId + '"]').addClass('found').attr('title', games[gameId][0])

	# Another trigger on body is waiting for this state, delay the initial set so we don't close out
	setTimeout ( ->
		$('body').attr('data-state','success')
	), 10

	# Clear out the game search if the GameInfo state if loading from that
	if fromGameSearch
		$('.references__container').remove()

	gamesImgReferences = JSON.parse(sessionStorage.games)
	# Set up the image references from the csv to pull from all relevant rows
	if gamesImgReferences[gameId]
		game = [gamesImgReferences[gameId]]
	else
		game = [gamesImgReferences[gameId + 'A'], gamesImgReferences[gameId + 'B']]

	# Create a wrapper for all the previews
	gameInfoWrapper = document.createElement('div')
	gameInfoWrapperClass = document.createAttribute('class')
	gameInfoWrapper.setAttributeNode(gameInfoWrapperClass)
	gameInfoWrapperClass.value = 'game-info-wrapper'

	game.forEach (row) ->
		for img in ['loading', 'screen1', 'screen2', 'inlay', 'arcade1', 'arcade2', 'arcade3', 'photo']
			if row[img]
				# Each image should have its own wrapper for flex
				imgWrapper = document.createElement('div')
				imgWrapperClass = document.createAttribute('class')
				imgWrapper.setAttributeNode(imgWrapperClass)
				imgWrapperClass.value = 'game-reference-image-wrapper'

				gameReferenceImg = document.createElement('img')
				gameReferenceImgSrc = document.createAttribute('src')
				gameReferenceImg.setAttributeNode(gameReferenceImgSrc)
				gameReferenceImgSrc.value = row[img]

				# Append the image to the image wrapper
				imgWrapper.appendChild(gameReferenceImg)
				# Append the image wrapper to the previews wrapper
				gameInfoWrapper.appendChild(imgWrapper)
	# Append the previews wrapper to the body
	document.getElementsByTagName('body')[0].appendChild(gameInfoWrapper)










# Click out of shimmed state
$('body').click (e) ->
	if $('body').attr('data-state') is 'finding' and not $(e.target).is('img[class*="reference--"]') and not $(e.target).is('button') and not $(e.target).is('input')
			$('.references__container').removeClass('expand')
			setTimeout ( ->
				$('body').removeAttr('data-state')
				$('.references__container').remove()
			), 250
	if $('body').attr('data-state') is 'success' and not $(e.target).is('.game-info-wrapper img')
		$('.game-info-wrapper').remove()
		$('body').removeAttr('data-state')










# Hints modal functionality
$('body').on 'click', '.game-menu__list-of-games .game-selection:not(".found")', (e) ->
	# Get the game id
	gameId = $(e.currentTarget).attr('data-gameid')
	game = JSON.parse(sessionStorage.games)[gameId]

	# Create modal wrapper
	modalWrapper = document.createElement('div')
	modalWrapperClass = document.createAttribute('class')
	modalWrapperClass.value = 'modal__container'
	modalWrapper.setAttributeNode(modalWrapperClass)

	# Use it to pull the hints available
	for img in ['loading', 'screen1', 'screen2', 'inlay', 'arcade1', 'arcade2', 'arcade3', 'photo']
		if game[img]
			# For each hint, create the listing in the modal
			button = document.createElement('button')
			buttonTrigger = document.createAttribute('class')
			buttonTrigger.value = 'hint-modal-toggle'
			buttonHint = document.createAttribute('data-hint')
			buttonHint.value = game[img]
			buttonGame = document.createAttribute('data-game')
			buttonGame.value = game.name
			button.setAttributeNode(buttonTrigger)
			button.setAttributeNode(buttonHint)
			button.setAttributeNode(buttonGame)
			buttonContent = document.createTextNode('hint: ' + img)
			button.appendChild(buttonContent)
			modalWrapper.appendChild(button)

	# Append the modal
	document.getElementsByTagName('body')[0].appendChild(modalWrapper)

	# Enable the modal
	$(modalWrapper).dialog
		title: 'Available hints for ' + game.name

$('body').on 'click', '.hint-modal-toggle', (e) ->
	img = e.currentTarget.getAttribute('data-hint')
	game = e.currentTarget.getAttribute('data-game')
	# Create modal wrapper
	modalWrapper = document.createElement('div')
	modalWrapperClass = document.createAttribute('class')
	modalWrapperClass.value = 'modal__container'
	modalWrapper.setAttributeNode(modalWrapperClass)

	# Append image
	image = document.createElement('img')
	imgSrc = document.createAttribute('src')
	imgSrc.value = img
	imgClass = document.createAttribute('class')
	imgClass.value = 'hint-image'
	image.setAttributeNode(imgSrc)
	image.setAttributeNode(imgClass)
	modalWrapper.appendChild(image)

	document.getElementsByTagName('body')[0].appendChild(modalWrapper)
	$(modalWrapper).dialog
		title: game + ' ' + e.currentTarget.childNodes[0].nodeValue










# Toggle the main menu
$('body').on 'click', '.game-menu__toggle', () ->
	$('.game-menu__wrapper').toggleClass('active')

# Zoom in on spectropolis
$('body').on 'click', '.spectropolis__zoom-in', () ->
	# Clear dimensions if they exist from draggable
	$('.ui-draggable').css({height: '', width: ''})
	# Set rem to 1px more
	newZoom = parseInt($('html').css('font-size')) + 1
	$('html').css('font-size', newZoom + 'px')

# Zoom out on spectropolis
$('body').on 'click', '.spectropolis__zoom-out', () ->
	# Clear dimensions if they exist from draggable
	$('.ui-draggable').css({height: '', width: ''})
	# Set rem to 1px more
	newZoom = Math.max(parseInt($('html').css('font-size')) - 1, 1)
	$('html').css('font-size', newZoom + 'px')

# List filtering options
$('body').on 'click', '[name="list-filter"]', (e) ->
	state = $(e.currentTarget).val()
	$('.game-menu__list-of-games .all-games').removeClass('list-filter__found list-filter__left list-filter__all').addClass(state)
	$('.list-filter').removeClass('selected')
	$(e.currentTarget).closest('.list-filter').addClass('selected')
