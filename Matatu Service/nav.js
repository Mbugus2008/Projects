/* METROTRANS SACCO web shell - shared left navigation menu.
   Regular pages include this once (<script src="nav.js"></script>); it builds the
   menu on the left, wraps the page content beside it and highlights the
   current page automatically.
   master.html embeds the pages in an iframe: in a frame the menu/header are
   skipped (the master provides them), and in the master the menu links swap
   the iframe instead of reloading the shell. */
(function(){
  var inFrame = false;
  try{ inFrame = window.self !== window.top; }catch(e){ inFrame = true; }
  var frame = document.getElementById("pageFrame");
  var here = frame ? ((location.hash || "").replace(/^#/, "").toLowerCase() || "dashboard.html")
                   : (location.pathname.split("/").pop() || "dashboard.html").toLowerCase();
  if(inFrame) document.documentElement.className += " inframe";
  var ICONS = {
    home: "<svg viewBox='0 0 24 24'><path d='M4 10.6 12 3.8l8 6.8' fill='none' stroke='#2E75B6' stroke-width='2.3' stroke-linecap='round' stroke-linejoin='round'/><path d='M6 9.4V20h12V9.4' fill='none' stroke='#2E75B6' stroke-width='2.3' stroke-linejoin='round'/><path d='M10 20v-5.2h4V20z' fill='#4C9AFF'/></svg>",
    bars: "<svg viewBox='0 0 24 24'><rect x='3' y='12' width='4.6' height='8' rx='1' fill='#8FAADC'/><rect x='9.7' y='6.5' width='4.6' height='13.5' rx='1' fill='#2E75B6'/><rect x='16.4' y='9.5' width='4.6' height='10.5' rx='1' fill='#4C9AFF'/></svg>",
    pin: "<svg viewBox='0 0 24 24'><path d='M12 22s-7-6.4-7-11.4a7 7 0 0 1 14 0C19 15.6 12 22 12 22z' fill='#E8503A'/><circle cx='12' cy='10.4' r='2.6' fill='#fff'/></svg>",
    users: "<svg viewBox='0 0 24 24'><circle cx='16.8' cy='9.2' r='2.8' fill='#8FAADC'/><path d='M16 14c3.4 0 5.8 2.3 5.8 6h-5.6z' fill='#8FAADC'/><circle cx='9' cy='7.8' r='3.8' fill='#2E75B6'/><path d='M2.6 20c0-3.6 2.9-5.9 6.4-5.9s6.4 2.3 6.4 5.9z' fill='#2E75B6'/></svg>"
  };
  var PAGES = [
    ["dashboard.html", "Dashboard", "home"],
    ["fleetreport.html", "Fleet report", "bars"],
    ["routes.html", "Route analysis", "pin"],
    ["agentsystems.html", "Agent Summary", "users"]
  ];
  var st = document.createElement("style");
  st.textContent = [
    ".sidenavwrap{display:flex;align-items:flex-start;gap:16px;max-width:1460px;margin:0 auto;padding:0 14px;box-sizing:border-box}",
    ".sncol{flex:1;min-width:0;display:flex;flex-direction:column}",
    ".sncol > main,.sncol > #status,.sncol > #error{max-width:none;margin-left:0;margin-right:0}",
    ".sidenav{flex:0 0 180px;position:sticky;top:calc(var(--topH,150px) + 12px);height:calc(100vh - var(--topH,150px) - 26px);max-height:calc(100vh - var(--topH,150px) - 26px);overflow:auto;display:flex;flex-direction:column;",
    "background:#fff;border:1px solid var(--line,#E3E6ED);border-radius:12px;box-shadow:0 1px 3px rgba(16,24,40,.06);padding:8px;margin:18px 0 0;box-sizing:border-box}",
    ".snhead{font-size:10px;color:#7A8599;text-transform:uppercase;letter-spacing:.08em;font-weight:700;padding:4px 8px 6px}",
    ".snitem{display:flex;align-items:center;gap:9px;padding:8px 9px;border-radius:8px;text-decoration:none;color:var(--ink,#1B2431);font-size:12.5px;font-weight:600;margin-bottom:2px}",
    ".snitem svg{width:20px;height:20px;flex:none}",
    ".snitem:hover{background:#E9EEF7}",
    ".snitem.cur{background:#D6E3F5;box-shadow:inset 0 0 0 1px #B7C9E6;color:var(--brand,#1F3863)}",
    "@media(max-width:900px){.sidenavwrap{flex-wrap:wrap;padding:0 8px}.sncol{flex:1 1 100%}.sidenav{display:none;position:static;flex-direction:column;height:auto;max-height:none;margin:0}.snhead{display:none}html.mobnav .sidenav{display:flex;position:fixed;top:calc(var(--topH,64px) + 10px);left:10px;width:min(272px,84vw);max-height:calc(100vh - var(--topH,64px) - 26px);height:auto;overflow:auto;z-index:400;margin:0;box-shadow:0 22px 60px rgba(6,14,30,.45)}html.mobnav .snhead{display:block}html.mobnav .snupd{flex-basis:auto;margin-top:auto;border-top:1px solid #EEF0F4;padding:9px 9px 4px}.mback{display:none;position:fixed;inset:0;background:rgba(10,16,30,.4);z-index:399}html.mobnav .mback{display:block}}",
    "@media print{.sidenav{display:none!important}.sidenavwrap{display:block;max-width:none;padding:0}.sncol{display:block}}",
    ".hsearch{position:relative;flex:0 1 320px;min-width:200px;margin-left:auto}",
    ".hsearch .hin{display:flex;align-items:center;gap:8px;background:#fff;border-radius:9px;padding:7px 11px;box-shadow:0 1px 3px rgba(0,0,0,.22)}",
    ".hsearch .hin svg{width:15px;height:15px;flex:none}",
    ".hsearch input{border:0;outline:0;background:transparent;font:600 13px system-ui,'Segoe UI',Arial,sans-serif;color:var(--ink,#1B2431);width:100%;min-width:0;padding:0}",
    ".hsearch input::placeholder{color:#8A94A6;font-weight:500}",
    ".hres{position:absolute;top:calc(100% + 8px);right:0;width:min(360px,86vw);background:#fff;border-radius:12px;box-shadow:0 14px 40px rgba(10,20,40,.30);border:1px solid #E3E6ED;padding:6px;display:none;z-index:90;max-height:min(430px,62vh);overflow:auto;text-align:left}",
    ".hsearch.open .hres{display:block}",
    ".hsec2{font-size:10px;color:#7A8599;text-transform:uppercase;letter-spacing:.08em;font-weight:700;padding:7px 9px 3px}",
    ".hit{display:flex;align-items:center;gap:9px;padding:8px 9px;border-radius:8px;cursor:pointer;color:var(--ink,#1B2431);font-size:12.5px;font-weight:600}",
    ".hit svg{width:19px;height:19px;flex:none}",
    ".hit .hsub{color:#7A8599;font-weight:500;font-size:10.5px;margin-left:auto;flex:none}",
    ".hit:hover,.hit.sel{background:#EEF3FB}",
    ".hit.sel{box-shadow:inset 0 0 0 1px #B7C9E6}",
    ".hempty{padding:12px 10px;color:#7A8599;font-size:12.5px}",
    "main section{scroll-margin-top:calc(var(--topH,150px) + 12px)}",
    ".flashsec{animation:flashsec 1.8s ease}",
    "@keyframes flashsec{0%{background:#FFF3C4}55%{background:#FFF8E0}100%{background:transparent}}",
    ".snupd{margin-top:auto;padding:9px 9px 4px;border-top:1px solid #EEF0F4;font-size:11px;color:var(--muted,#6B7280);font-weight:500;line-height:1.5;display:block;word-break:break-word}",
    "@media(min-width:901px){.ribbon{padding-left:max(210px,calc(50% - 520px))}}",
    "@media(max-width:900px){.snupd{flex-basis:100%;margin-top:0;border-top:0;padding:4px 9px 2px}}",
    "@media print{.hsearch{display:none!important}}",
    ".hbtn{display:none}",
    "@media(max-width:900px){.hbtn{display:inline-flex;align-items:center;justify-content:center;width:38px;height:38px;flex:none;border:0;border-radius:10px;background:rgba(255,255,255,.14);cursor:pointer;margin-right:2px}.hbtn:hover{background:rgba(255,255,255,.26)}.hbtn svg{width:20px;height:20px}.brand{margin-right:auto}#mRibbon{display:none}}",
    "html.inframe .top{display:none!important}"
  ].join("");
  document.head.appendChild(st);

  function place(){
    var t = document.querySelector(".top") || document.querySelector("header");
    var h = t ? Math.round(t.getBoundingClientRect().height) : 0;
    document.documentElement.style.setProperty("--topH", h + "px");
  }
  window.addEventListener("resize", place);

  /* embedded in master.html: the master owns the header + menu, nothing to build here */
  if(inFrame){
    place();
    return;
  }

  var nav = document.createElement("nav");
  nav.className = "sidenav";
  var SHELLV = "?v=2"; // bump when the shell changes - menu links then skip stale browser copies
  function buildMenu(){
    var html = "<div class='snhead'>Menu</div>";
    PAGES.forEach(function(p){
      var cur = p[0] === here;
      html += "<a class='snitem" + (cur ? " cur" : "") + "' data-file='" + p[0] + "' href='" + p[0] + SHELLV + "'" + (cur ? " aria-current='page'" : "") +
        ">" + ICONS[p[2]] + "<span>" + p[1] + "</span></a>";
    });
    nav.innerHTML = html;
    if(frame){
      Array.prototype.forEach.call(nav.querySelectorAll(".snitem"), function(a){
        a.addEventListener("click", function(ev){ ev.preventDefault(); goPage(a.getAttribute("data-file")); });
      });
    }
  }
  function goPage(file){
    here = String(file).toLowerCase();
    history.replaceState(null, "", here === "dashboard.html" ? location.pathname : ("#" + here));
    frame.src = here + SHELLV;
    var lbl = document.getElementById("pgLabel");
    if(lbl) PAGES.forEach(function(p){ if(p[0] === here) lbl.textContent = p[1]; });
    buildMenu();
  }
  if(frame){
    var lbl0 = document.getElementById("pgLabel");
    if(lbl0) PAGES.forEach(function(p){ if(p[0] === here) lbl0.textContent = p[1]; });
    if(((frame.getAttribute("src") || "").split("?")[0] || "").toLowerCase() !== here) frame.src = here + SHELLV;
  }
  buildMenu();

  /* ---- master ribbon: ONE stable strip with all the filters (drives the framed page) ---- */
  var mRib = null;
  if(frame){
    mRib = document.createElement("div");
    mRib.className = "ribbon noprint";
    mRib.id = "mRibbon";
    var hdr2 = document.querySelector(".top header") || document.querySelector("header");
    if(hdr2){ var hs2 = hdr2.querySelector(".hsearch"); if(hs2) hdr2.insertBefore(mRib, hs2); else hdr2.appendChild(mRib); }
    var MI = {
      tag: "<svg viewBox='0 0 24 24'><path d='M3.6 6.8c0-.9.7-1.6 1.6-1.6h6.2c.45 0 .88.19 1.19.52l6.1 6.3c.62.64.6 1.66-.05 2.27l-5.5 5.2c-.63.6-1.63.58-2.24-.04l-5.7-5.9a1.6 1.6 0 0 1-.44-1.12z' fill='#8FAADC' stroke='#2E75B6' stroke-width='1.4' stroke-linejoin='round'/><circle cx='7.6' cy='8.9' r='1.25' fill='#fff'/></svg>",
      truck: "<svg viewBox='0 0 24 24'><rect x='2.8' y='9.4' width='11.6' height='7.4' rx='1.3' fill='#8FAADC'/><path d='M14.4 11.6h3.4l2.8 3v2.2h-6.2z' fill='#2E75B6'/><circle cx='7' cy='17.8' r='1.7' fill='#1F3863'/><circle cx='17.2' cy='17.8' r='1.7' fill='#1F3863'/></svg>",
      person: "<svg viewBox='0 0 24 24'><circle cx='12' cy='8.2' r='3.7' fill='#2E75B6'/><path d='M5 20.2c0-3.9 3.2-6.1 7-6.1s7 2.2 7 6.1z' fill='#8FAADC'/></svg>",
      users: "<svg viewBox='0 0 24 24'><circle cx='16.8' cy='9.2' r='2.8' fill='#8FAADC'/><path d='M16 14c3.4 0 5.8 2.3 5.8 6h-5.6z' fill='#8FAADC'/><circle cx='9' cy='7.8' r='3.8' fill='#2E75B6'/><path d='M2.6 20c0-3.6 2.9-5.9 6.4-5.9s6.4 2.3 6.4 5.9z' fill='#2E75B6'/></svg>",
      pin: "<svg viewBox='0 0 24 24'><path d='M12 22s-7-6.4-7-11.4a7 7 0 0 1 14 0C19 15.6 12 22 12 22z' fill='#E8503A'/><circle cx='12' cy='10.4' r='2.6' fill='#fff'/></svg>",
      x: "<svg viewBox='0 0 24 24'><circle cx='12' cy='12' r='8.6' fill='#FDE7E4' stroke='#E8503A' stroke-width='1.8'/><path d='M9 9l6 6M15 9l-6 6' stroke='#E8503A' stroke-width='2' stroke-linecap='round'/></svg>",
      refresh: "<svg viewBox='0 0 24 24' fill='none' stroke='#2FA84F' stroke-width='2.3' stroke-linecap='round' stroke-linejoin='round'><path d='M21 12a9 9 0 1 1-2.6-6.4'/><polyline points='21 3.2 21 9 15.2 9'/></svg>",
      clock: "<svg viewBox='0 0 24 24' fill='none' stroke='#F29900' stroke-width='2.3' stroke-linecap='round' stroke-linejoin='round'><circle cx='12' cy='12' r='8.6'/><polyline points='12 7.4 12 12.3 15.4 14'/></svg>",
      range: "<svg viewBox='0 0 24 24'><rect x='3.5' y='5' width='17' height='15.5' rx='2.2' fill='#fff' stroke='#2E75B6' stroke-width='1.9'/><path d='M3.5 9.8h17' stroke='#2E75B6' stroke-width='1.9'/><path d='M8 3.4v3.2M16 3.4v3.2' stroke='#2E75B6' stroke-width='1.9' stroke-linecap='round'/><path d='M7.2 14.9h9.6M7.2 14.9l2.5-2.5M16.8 14.9l-2.5 2.5' stroke='#4C9AFF' stroke-width='1.9' stroke-linecap='round' stroke-linejoin='round'/></svg>",
      calB: "<svg viewBox='0 0 24 24'><rect x='3.5' y='5' width='17' height='15.5' rx='2.2' fill='#fff' stroke='#2E75B6' stroke-width='1.9'/><path d='M3.5 9.8h17' stroke='#2E75B6' stroke-width='1.9'/><path d='M8 3.4v3.2M16 3.4v3.2' stroke='#2E75B6' stroke-width='1.9' stroke-linecap='round'/><rect x='6.8' y='12.3' width='10.4' height='5.4' rx='1.2' fill='#4C9AFF'/></svg>",
      calG: "<svg viewBox='0 0 24 24'><rect x='3.5' y='5' width='17' height='15.5' rx='2.2' fill='#fff' stroke='#2FA84F' stroke-width='1.9'/><path d='M3.5 9.8h17' stroke='#2FA84F' stroke-width='1.9'/><path d='M8 3.4v3.2M16 3.4v3.2' stroke='#2FA84F' stroke-width='1.9' stroke-linecap='round'/><rect x='6.6' y='12' width='11' height='2.6' rx='1.3' fill='#2FA84F'/><rect x='6.6' y='15.6' width='6' height='2.6' rx='1.3' fill='#97D9AC'/></svg>",
      calP: "<svg viewBox='0 0 24 24'><rect x='3.5' y='5' width='17' height='15.5' rx='2.2' fill='#fff' stroke='#7A5AF8' stroke-width='1.9'/><path d='M3.5 9.8h17' stroke='#7A5AF8' stroke-width='1.9'/><path d='M8 3.4v3.2M16 3.4v3.2' stroke='#7A5AF8' stroke-width='1.9' stroke-linecap='round'/><circle cx='8.4' cy='13.2' r='1.25' fill='#7A5AF8'/><circle cx='12' cy='13.2' r='1.25' fill='#A995FF'/><circle cx='15.6' cy='13.2' r='1.25' fill='#7A5AF8'/><circle cx='8.4' cy='16.8' r='1.25' fill='#A995FF'/><circle cx='12' cy='16.8' r='1.25' fill='#7A5AF8'/></svg>",
      print: "<svg viewBox='0 0 24 24'><path d='M7 8.5V3.8h10v4.7z' fill='#8FAADC'/><rect x='3' y='8.5' width='18' height='8.6' rx='1.6' fill='#2E75B6'/><rect x='6.6' y='14.2' width='10.8' height='6.4' rx='0.9' fill='#fff' stroke='#2E75B6' stroke-width='1.4'/><circle cx='17.7' cy='11.5' r='0.95' fill='#fff'/></svg>",
      csv: "<svg viewBox='0 0 24 24'><rect x='4' y='3.5' width='16' height='17' rx='2' fill='#FDF3E2' stroke='#D97706' stroke-width='1.8'/><path d='M8 8.2h8M8 12h8M8 15.8h5' stroke='#D97706' stroke-width='1.7' stroke-linecap='round'/></svg>",
      pdf: "<svg viewBox='0 0 24 24'><rect x='5' y='3.5' width='14' height='17' rx='2' fill='#FDECEA' stroke='#C0392B' stroke-width='1.8'/><path d='M9 9h6M9 12.5h6M9 16h4' stroke='#C0392B' stroke-width='1.6' stroke-linecap='round'/></svg>",
      xlsx: "<svg viewBox='0 0 24 24'><rect x='4' y='3.5' width='16' height='17' rx='2' fill='#E7F4EC' stroke='#217346' stroke-width='1.8'/><path d='M8 8.2h8M8 12h8M8 15.8h8' stroke='#217346' stroke-width='1.7' stroke-linecap='round'/></svg>"
    };
    mRib.innerHTML =
      "<div class='rmain'>" +
      "<div class='rgroup fhold'><div class='rbtns v2'><div class='rbrow'><input type='date' id='dateOne' class='rdate'><input type='text' id='navDate' class='rdate rnav' autocomplete='off' spellcheck='false' placeholder='010126..013126 · T' title='NAV-style date: 010126 = 01-01-2026 · 010126..013126 = a range · T = today'><button class='rbtn' id='rangeBtn'>" + MI.range + "Range</button></div>" +
      "<div class='rbrow'><button class='rbtn' data-days='1'>" + MI.calB + "Today</button><button class='rbtn' data-days='7'>" + MI.calG + "7 days</button><button class='rbtn' data-days='30'>" + MI.calP + "30 days</button></div></div>" +
      "<div class='rlabel'>Date</div>" +
      "<div class='fdrop' id='fdRange'><div class='fbrow'><span class='flabel'>Custom range</span><input type='date' id='dateFrom' class='rdate'><span style='color:#6B7280'>&rarr;</span><input type='date' id='dateTo' class='rdate'></div></div></div>" +
      "<div class='rgroup'><div class='rbtns v2'><div class='rbrow'><button class='rbtn' id='refresh'>" + MI.refresh + "Refresh</button></div><div class='rbrow'><button class='rbtn' id='autoBtn'>" + MI.clock + "Auto</button></div></div><div class='rlabel'>Refresh</div></div>" +
      "<div class='rgroup fhold' id='mFilters'><div class='rbtns v2'>" +
      "<div class='rbrow'><button class='rbtn' id='ftType'>" + MI.tag + "Type<span class='fbadge' id='fbType'></span></button><button class='rbtn' id='ftVeh'>" + MI.truck + "Vehicle<span class='fbadge' id='fbVeh'></span></button><button class='rbtn' id='ftOwner'>" + MI.person + "Owner<span class='fbadge' id='fbOwner'></span></button></div>" +
      "<div class='rbrow'><button class='rbtn' id='ftAgent'>" + MI.users + "Agent<span class='fbadge' id='fbAgent'></span></button><button class='rbtn' id='ftRoute'>" + MI.pin + "Route<span class='fbadge' id='fbRoute'></span></button><button class='rbtn' id='mClear'>" + MI.x + "Clear</button></div>" +
      "</div><div class='rlabel'>Filters</div>" +
      "<div class='fdrop' id='fdType'><div class='fbrow'><span class='flabel'>Collection type</span><div class='chips' id='typeFilters'></div></div></div>" +
      "<div class='fdrop' id='fdVeh'><div class='fbrow'><span class='flabel'>Vehicle</span><div class='chips' id='vehChips'></div><input class='vin' id='vehInput' list='vehSuggestions' placeholder='vehicle or fleet no, then Enter' autocomplete='off'><datalist id='vehSuggestions'></datalist><span class='vhcount' id='vehCount'></span><button class='vclear' id='vehClear' style='display:none'>clear all</button></div><div class='fbrow' id='mSavedRow'><span class='flabel'>Saved filters</span><div class='chips' id='savedFilters'></div><input class='vin' id='sfName' placeholder='name it - e.g. M601-689 fleet' style='max-width:230px' autocomplete='off'><button class='vclear' id='sfSave'>save current</button></div></div>" +
      "<div class='fdrop' id='fdOwner'><div class='fbrow'><span class='flabel'>Ownership</span><div class='fbseg' id='mOwner'><button id='mOwnAll' class='on'>All</button><button id='mOwnSac'>Sacco</button><button id='mOwnInv'>Investor</button></div></div></div>" +
      "<div class='fdrop' id='fdAgent'><div class='fbrow'><span class='flabel'>Agent</span><div class='chips' id='agentFilters'></div><button class='vclear' id='agentMore' style='display:none'>+ more</button></div></div>" +
      "<div class='fdrop' id='fdRoute'><div class='fbrow'><span class='flabel'>Route</span><div class='chips' id='routeFilters'></div></div></div>" +
      "</div>" +
      "<div class='rgroup'><div class='rbtns v2'><div class='rbrow'><button class='rbtn' id='csvBtn' title='Export CSV'>" + MI.csv + "CSV</button><button class='rbtn' id='pdfBtn' title='Export PDF'>" + MI.pdf + "PDF</button></div>" +
      "<div class='rbrow'><button class='rbtn' id='xlsxBtn' title='Export Excel (XLSX)'>" + MI.xlsx + "XLSX</button><button class='rbtn' id='printBtn' title='Print'>" + MI.print + "Print</button></div></div><div class='rlabel'>Output</div></div>" +
      "</div>";
    var CONTAINERS = ["typeFilters","vehChips","savedFilters","routeFilters","agentFilters"];
    function fdoc(){ try{ return frame.contentDocument; }catch(e){ return null; } }
    function frib(){ var d = fdoc(); return d ? d.querySelector(".ribbon") : null; }
    function closeMDrops(){ Array.prototype.forEach.call(mRib.querySelectorAll(".fdrop.open"), function(p){ p.classList.remove("open"); }); }
    function pairFor(el){
      var d = fdoc(), f = frib(); if(!d || !f) return null;
      if(el.id){
        if(el.id === "mClear") return d.getElementById("fClearAll") || d.getElementById("fClear");
        if(el.id === "printBtn") return d.getElementById("printBtn") || d.getElementById("print");
        if(el.id === "dateOne") return d.getElementById("dateOne") || d.getElementById("date") || d.getElementById("dateFrom");
        if(el.id === "dateFrom" || el.id === "dateTo") return d.getElementById("dateFrom") ? d.getElementById(el.id) : d.getElementById("date");
        var byId = d.getElementById(el.id);
        if(byId) return byId;
      }
      var attrs = ["data-days","data-preset","data-export"];
      for(var i = 0; i < attrs.length; i++){
        var v = el.getAttribute && el.getAttribute(attrs[i]);
        if(v != null){
          var m2 = f.querySelector("button[" + attrs[i] + '="' + v + '"]');
          if(!m2 && attrs[i] === "data-days" && v === "1") m2 = d.getElementById("todayBtn");
          if(m2) return m2;
        }
      }
      return null;
    }
    function setOwnerMode(mode){
      var d = fdoc(); if(!d) return;
      var seg = d.getElementById("ownerFilters");
      if(!seg) return;
      var btns = seg.querySelectorAll("button");
      if(btns.length >= 3){
        var idx = mode === "sacco" ? 1 : (mode === "investor" ? 2 : 0);
        btns[idx].click();
        return;
      }
      var chips = seg.querySelectorAll(".chip");
      Array.prototype.forEach.call(chips, function(ch){
        var lab = (ch.textContent || "").toUpperCase();
        var isOn = ch.classList.contains("on");
        if(mode === "all"){ if(isOn) ch.click(); }
        else {
          var want = mode === "sacco" ? "SACCO" : "INVESTOR";
          if(lab.indexOf(want) !== -1){ if(!isOn) ch.click(); }
          else if(isOn) ch.click();
        }
      });
    }
    function wireContainer(cid){
      var mc = mRib.querySelector("#" + cid); if(!mc) return;
      Array.prototype.forEach.call(mc.children, function(ch, i){
        ch.addEventListener("click", function(ev){
          ev.preventDefault(); ev.stopPropagation();
          var d = fdoc(); var fc = d && d.getElementById(cid);
          var t = fc && fc.children[i];
          if(!t) return;
          var x = ev.target && ev.target.closest ? ev.target.closest(".x") : null;
          if(x){
            var fx = t.querySelector(".x");
            if(fx){ fx.click(); return; }
          }
          if(t.click) t.click();
        });
      });
    }
    function wireRibbon(){
      Array.prototype.forEach.call(mRib.querySelectorAll("button"), function(btn){
        if(btn.closest && btn.closest(".fhold") && !btn.closest(".fdrop")){
          var pid = btn.id === "rangeBtn" ? "fdRange" : (btn.id && btn.id.indexOf("ft") === 0 ? ("fd" + btn.id.slice(2)) : null);
          var pan = pid ? mRib.querySelector("#" + pid) : null;
          if(pan){
            btn.addEventListener("click", function(ev){
              ev.preventDefault(); ev.stopPropagation();
              var was = pan.classList.contains("open");
              closeMDrops();
              if(!was){ pan.style.left = Math.max(-6, btn.offsetLeft - 12) + "px"; pan.classList.add("open"); }
            });
            return;
          }
        }
        btn.addEventListener("click", function(ev){
          var t = pairFor(btn);
          if(!t || !t.click) return;
          ev.preventDefault(); ev.stopPropagation();
          t.click();
        });
      });
      Array.prototype.forEach.call(mRib.querySelectorAll("input"), function(inp){
        inp.addEventListener("change", function(){
          var t = pairFor(inp); if(!t) return;
          t.value = inp.value;
          var d = fdoc(); if(!d) return;
          t.dispatchEvent(new d.defaultView.Event("input", {bubbles:true}));
          t.dispatchEvent(new d.defaultView.Event("change", {bubbles:true}));
        });
        if(inp.id === "navDate"){
          // typed NAV date: mirror the text, then let the page parse and apply it
          inp.addEventListener("keydown", function(ev){
            if(ev.key !== "Enter") return;
            ev.preventDefault();
            var t = pairFor(inp); var d = fdoc(); if(!t || !d) return;
            t.value = inp.value;
            t.dispatchEvent(new d.defaultView.Event("input", {bubbles:true}));
            t.dispatchEvent(new d.defaultView.Event("change", {bubbles:true}));
          });
          return;
        }
        inp.addEventListener("keydown", function(ev){
          if(ev.key !== "Enter") return;
          ev.preventDefault();
          var t = pairFor(inp); var d = fdoc(); if(!t || !d) return;
          t.dispatchEvent(new d.defaultView.KeyboardEvent("keydown", {key:"Enter", bubbles:true}));
        });
      });
      CONTAINERS.forEach(wireContainer);
      var oa = mRib.querySelector("#mOwnAll"), os = mRib.querySelector("#mOwnSac"), oi = mRib.querySelector("#mOwnInv");
      if(oa) oa.addEventListener("click", function(ev){ ev.preventDefault(); ev.stopPropagation(); setOwnerMode("all"); });
      if(os) os.addEventListener("click", function(ev){ ev.preventDefault(); ev.stopPropagation(); setOwnerMode("sacco"); });
      if(oi) oi.addEventListener("click", function(ev){ ev.preventDefault(); ev.stopPropagation(); setOwnerMode("investor"); });
    }
    function syncRibbon(){
      var d = fdoc(); if(!d || !mRib.firstChild) return;
      Array.prototype.forEach.call(mRib.querySelectorAll("[id]"), function(el){
        var fe = d.getElementById(el.id);
        if(!fe && el.id === "dateOne") fe = d.getElementById("date") || d.getElementById("dateFrom");
        if(!fe && (el.id === "dateFrom" || el.id === "dateTo")) fe = d.getElementById("date");
        if(!fe){
          if(el.tagName === "SPAN"){ if(el.textContent) el.textContent = ""; el.classList.remove("on"); }
          else if(el.tagName === "BUTTON"){ el.classList.remove("active"); }
          return;
        }
        if(el.closest && el.closest(".fdrop")){
          if(el.tagName === "INPUT" && el !== document.activeElement && el.value !== fe.value) el.value = fe.value;
          return;
        }
        var fs = fe.getAttribute("style"), ms = el.getAttribute("style");
        if((fs || "") !== (ms || "")) el.setAttribute("style", fs || "");
        if(el.tagName === "INPUT"){
          if(el !== document.activeElement && el.value !== fe.value) el.value = fe.value;
          return;
        }
        if(el.tagName === "SPAN"){
          if(el.className !== fe.className) el.className = fe.className;
          if(el.textContent !== fe.textContent) el.textContent = fe.textContent;
          return;
        }
        if(el.className !== fe.className) el.className = fe.className;
      });
      CONTAINERS.forEach(function(cid){
        var mc = mRib.querySelector("#" + cid), fc = d.getElementById(cid);
        if(!mc) return;
        if(!fc){ if(mc.innerHTML) mc.innerHTML = ""; return; }
        if(mc.innerHTML !== fc.innerHTML){ mc.innerHTML = fc.innerHTML; wireContainer(cid); }
      });
      ["vehClear","agentMore"].forEach(function(id){
        var me = mRib.querySelector("#" + id), fe = d.getElementById(id);
        if(me && fe) me.style.display = fe.style.display === "none" ? "none" : "";
      });
      var mdl = d.getElementById("vehSuggestions") || d.getElementById("vehList");
      var mmd = mRib.querySelector("#vehSuggestions");
      if(mmd && mdl && mmd.innerHTML !== mdl.innerHTML) mmd.innerHTML = mdl.innerHTML;
      var mSaveRow = mRib.querySelector("#mSavedRow");
      if(mSaveRow) mSaveRow.style.display = d.getElementById("savedFilters") ? "" : "none";
      var mSaveBtn = mRib.querySelector("#sfSave");
      if(mSaveBtn) mSaveBtn.classList.toggle("dim", !d.getElementById("sfSave"));
      var AVAIL = [["ftType","typeFilters"],["ftVeh","vehChips"],["ftOwner","ownerFilters"],["ftAgent","agentFilters"],["ftRoute","routeFilters"]];
      AVAIL.forEach(function(p2){
        var btn = mRib.querySelector("#" + p2[0]); if(!btn) return;
        btn.classList.toggle("dim", !d.getElementById(p2[1]));
      });
      Array.prototype.forEach.call(mRib.querySelectorAll("button"), function(b){
        if(b.closest && (b.closest(".fhold") || b.closest(".fdrop"))) return;
        b.classList.toggle("dim", !pairFor(b));
      });
      Array.prototype.forEach.call(mRib.querySelectorAll("[data-days]"), function(b){ b.classList.toggle("dim", !pairFor(b)); });
      ["dateOne","dateFrom","dateTo","rangeBtn","navDate"].forEach(function(id){
        var el = mRib.querySelector("#" + id); if(!el) return;
        el.classList.toggle("dim", !pairFor(el));
      });
      var mode = "all";
      var seg = d.getElementById("ownerFilters");
      if(seg){
        var sbtns = seg.querySelectorAll("button");
        if(sbtns.length >= 3){
          if(sbtns[1].classList.contains("on")) mode = "sacco";
          else if(sbtns[2].classList.contains("on")) mode = "investor";
        } else {
          var on = [];
          Array.prototype.forEach.call(seg.querySelectorAll(".chip.on"), function(c){ on.push((c.textContent || "").toUpperCase()); });
          if(on.length === 1 && on[0].indexOf("SACCO") !== -1) mode = "sacco";
          else if(on.length === 1 && on[0].indexOf("INVESTOR") !== -1) mode = "investor";
        }
      }
      var oa = mRib.querySelector("#mOwnAll"), os2 = mRib.querySelector("#mOwnSac"), oi2 = mRib.querySelector("#mOwnInv");
      if(oa){ oa.classList.toggle("on", mode === "all"); os2.classList.toggle("on", mode === "sacco"); oi2.classList.toggle("on", mode === "investor"); }
      var ownBtn = mRib.querySelector("#ftOwner"); if(ownBtn) ownBtn.classList.toggle("active", mode !== "all");
      var mOwner = mRib.querySelector("#mOwner"); if(mOwner) mOwner.classList.toggle("dim", !seg);
      var ct = mRib.querySelector("#mClear"); if(ct) ct.classList.toggle("dim", !(d.getElementById("fClearAll") || d.getElementById("fClear")));
    }
    function buildMasterRibbon(){
      try{
        var oldSt = document.getElementById("mRibStyle"); if(oldSt) oldSt.parentNode.removeChild(oldSt);
        var css = "";
        Array.prototype.forEach.call(fdoc().querySelectorAll("style"), function(s){ css += s.textContent + "\n"; });
        var st2 = document.createElement("style");
        st2.id = "mRibStyle";
        st2.textContent = "@scope (#mRibbon) {\n" + css + "\n}";
        document.head.appendChild(st2);
      }catch(e){}
      syncRibbon();
    }
    closeMDrops();
    wireRibbon();
    syncRibbon();
    place();
    frame.addEventListener("load", function(){ setTimeout(buildMasterRibbon, 250); });
    document.addEventListener("mousedown", function(ev){
      var t = ev.target;
      if(t && t.closest && (t.closest(".fhold") || t.closest(".fdrop"))) return;
      closeMDrops();
    });
    document.addEventListener("keydown", function(ev){ if(ev.key === "Escape") closeMDrops(); });
    setInterval(syncRibbon, 700);
    if(frame.contentDocument && frame.contentDocument.readyState === "complete") setTimeout(buildMasterRibbon, 400);
  }

  /* #updated lives at the bottom of the menu (the pages keep updating it by id) */
  var upd = document.getElementById("updated");
  if(upd){
    var foot = document.createElement("div");
    foot.className = "snupd";
    foot.appendChild(upd);
    nav.appendChild(foot);
  }

  var main = document.querySelector("main");
  var footer = document.querySelector("footer");
  var err = document.getElementById("error");
  var status = document.getElementById("status");
  if(main){
    var anchor = err || status || main;
    var wrap = document.createElement("div");
    wrap.className = "sidenavwrap";
    var col = document.createElement("div");
    col.className = "sncol";
    anchor.parentNode.insertBefore(wrap, anchor);
    if(err) col.appendChild(err);
    if(status) col.appendChild(status);
    col.appendChild(main);
    if(footer) col.appendChild(footer);
    wrap.appendChild(nav);
    wrap.appendChild(col);
  }

  /* ---- mobile: hamburger toggles the menu drawer ---- */
  if(!inFrame){
    var hdrM = document.querySelector("header");
    if(hdrM){
      var hb = document.createElement("button");
      hb.className = "hbtn noprint";
      hb.type = "button";
      hb.setAttribute("aria-label", "Menu");
      hb.innerHTML = "<svg viewBox='0 0 24 24' fill='none' stroke='#fff' stroke-width='2.4' stroke-linecap='round'><path d='M4 7h16M4 12h16M4 17h16'/></svg>";
      hdrM.insertBefore(hb, hdrM.firstChild);
      var mbg = document.createElement("div");
      mbg.className = "mback noprint";
      document.body.appendChild(mbg);
      var closeMob = function(){ document.documentElement.classList.remove("mobnav"); };
      hb.addEventListener("click", function(ev){ ev.preventDefault(); ev.stopPropagation(); document.documentElement.classList.toggle("mobnav"); });
      mbg.addEventListener("click", closeMob);
      document.addEventListener("keydown", function(ev){ if(ev.key === "Escape") closeMob(); });
      window.addEventListener("resize", function(){ if(window.innerWidth > 900) closeMob(); });
      document.addEventListener("click", function(ev){
        var t2 = ev.target;
        if(t2 && t2.closest && (t2.closest(".sidenav a") || t2.closest(".snitem"))) closeMob();
      });
    }
  }

  /* ---- header search: pages + sections of the current page ---- */
  var ICONSEC = "<svg viewBox='0 0 24 24'><rect x='4' y='4.5' width='16' height='15' rx='2.4' fill='#EDF2FB' stroke='#2E75B6' stroke-width='1.8'/><path d='M7.6 9.2h8.8M7.6 12.6h8.8M7.6 16h5.2' stroke='#2E75B6' stroke-width='1.8' stroke-linecap='round'/></svg>";
  var hdr = document.querySelector("header");
  if(hdr){
    var sc = document.createElement("div");
    sc.className = "hsearch noprint";
    sc.innerHTML = "<div class='hin'><svg viewBox='0 0 24 24' fill='none' stroke='#5B6B85' stroke-width='2.2' stroke-linecap='round'><circle cx='10.6' cy='10.6' r='6.6'/><path d='M20.2 20.2l-4.8-4.8'/></svg><input type='text' placeholder='Search pages, sections\u2026' aria-label='Search' autocomplete='off' spellcheck='false'></div><div class='hres'></div>";
    hdr.appendChild(sc);
    var inEl = sc.querySelector("input"), resEl = sc.querySelector(".hres"), flat = [], hi = -1;
    var esc = function(s){ return s.replace(/&/g,"&amp;").replace(/</g,"&lt;").replace(/>/g,"&gt;").replace(/"/g,"&quot;"); };
    var secs = [];
    function scanSecs(){
      secs = [];
      Array.prototype.forEach.call(document.querySelectorAll("main section"), function(s){
        var h = s.querySelector("h2,h3"); if(!h) return;
        var c = h.cloneNode(true);
        Array.prototype.forEach.call(c.querySelectorAll("button,a,svg,.hact,.hbtns,.chev,.sub"), function(x){ if(x.parentNode) x.parentNode.removeChild(x); });
        var t = (c.textContent || "").replace(/\s+/g," ").trim();
        if(!t) return;
        if(t.length > 72) t = t.slice(0,72).replace(/\s+$/,"") + "\u2026";
        if(!secs.some(function(o){ return o.label === t; })) secs.push({label:t, el:s});
      });
    }
    function render(){
      var q = inEl.value.trim().toLowerCase();
      var pages = PAGES.filter(function(p){ return !q || p[1].toLowerCase().indexOf(q) >= 0; })
        .map(function(p){ return {t:"p", label:p[1], sub:(p[0]===here ? "current page" : "page"), icon:ICONS[p[2]], href:p[0]+SHELLV, file:p[0]}; });
      var hits = secs.filter(function(s){ return !q || s.label.toLowerCase().indexOf(q) >= 0; })
        .map(function(s){ return {t:"s", label:s.label, sub:"on this page", icon:ICONSEC, el:s.el}; });
      flat = pages.concat(hits);
      var html = "", last = "";
      flat.forEach(function(r, i){
        if(r.t !== last){ html += "<div class='hsec2'>" + (r.t === "p" ? "Pages" : "On this page") + "</div>"; last = r.t; }
        html += "<div class='hit" + (i === hi ? " sel" : "") + "' data-i='" + i + "'>" + r.icon + "<span>" + esc(r.label) + "</span><span class='hsub'>" + r.sub + "</span></div>";
      });
      if(!flat.length) html = "<div class='hempty'>No matches for \u201C" + esc(inEl.value.trim()) + "\u201D</div>";
      resEl.innerHTML = html;
      Array.prototype.forEach.call(resEl.querySelectorAll(".hit"), function(el){
        el.addEventListener("mousedown", function(ev){ ev.preventDefault(); go(+el.getAttribute("data-i")); });
      });
    }
    function mark(){
      Array.prototype.forEach.call(resEl.querySelectorAll(".hit"), function(el, i){ el.classList.toggle("sel", i === hi); });
      var sel = resEl.querySelector(".hit.sel");
      if(sel && sel.scrollIntoView) sel.scrollIntoView({block:"nearest"});
    }
    function go(i){
      var r = flat[i]; if(!r) return;
      if(r.t === "p"){
        if(frame){ sc.classList.remove("open"); inEl.value = ""; hi = -1; goPage(r.file); }
        else location.href = r.href;
        return;
      }
      sc.classList.remove("open"); inEl.value = ""; hi = -1;
      if(r.el.classList.contains("collapsed")){
        r.el.classList.remove("collapsed");
        var c = r.el.querySelector(".chev"); if(c) c.textContent = "\u25BE";
      }
      r.el.scrollIntoView({behavior:"smooth", block:"start"});
      r.el.classList.remove("flashsec"); void r.el.offsetWidth; r.el.classList.add("flashsec");
    }
    inEl.addEventListener("focus", function(){ scanSecs(); hi = 0; render(); sc.classList.add("open"); });
    inEl.addEventListener("input", function(){ hi = 0; render(); sc.classList.add("open"); });
    inEl.addEventListener("keydown", function(ev){
      if(ev.key === "ArrowDown" || ev.key === "ArrowUp"){
        ev.preventDefault();
        if(!flat.length) return;
        hi = ev.key === "ArrowDown" ? (hi + 1) % flat.length : (hi - 1 + flat.length) % flat.length;
        mark(); return;
      }
      if(ev.key === "Enter"){ ev.preventDefault(); go(hi < 0 ? 0 : hi); return; }
      if(ev.key === "Escape"){ sc.classList.remove("open"); inEl.blur(); }
    });
    document.addEventListener("mousedown", function(ev){ if(!sc.contains(ev.target)) sc.classList.remove("open"); });
  }

  place();
})();
