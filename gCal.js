console.log('Simple gCal Loaded');

function toggleSidebar() {
	let sidebar = document.getElementById("nav");
	let calendar = document.getElementById("mainbody");
	if (sidebar.classList.contains("hidden")) {
    	sidebar.classList.remove("hidden");
		calendar.classList.remove("expanded");
	}
	else {
	    sidebar.classList.add("hidden");
		calendar.classList.add("expanded");
	}
}

function createSidebarToggle() {
	let toggle = document.createElement("div")
	let toggleButton = document.createElement("button");
	let arrow = document.createElement("div")
	arrow.append(document.createTextNode(">"))
	toggle.id = "sidebar-toggle"
	toggleButton.onclick = toggleSidebar
	toggleButton.append(arrow)
	toggle.append(toggleButton)
	document.getElementById("nav").append(toggle)
}

createSidebarToggle();
toggleSidebar();

