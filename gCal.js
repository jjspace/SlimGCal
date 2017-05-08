console.log('Simple gCal Loaded');

function showSidebar() {
	let sidebar = document.getElementById('nav');
	let calendar = document.getElementById('mainbody');
	sidebar.classList.remove('hidden');
	calendar.classList.remove('expanded');
}

function hideSidebar() {
	let sidebar = document.getElementById('nav');
	let calendar = document.getElementById('mainbody');
	sidebar.classList.add('hidden');
	calendar.classList.add('expanded');
}

function toggleSidebar() {
	let sidebar = document.getElementById('nav');
	if (sidebar.classList.contains("hidden")) {
		//is already hidden
		showSidebar();
	}
	else {
		//not hidden
		hideSidebar();
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

function createEventListeners() {
	document.getElementById('maincell').addEventListener('click', hideSidebar);
	document.getElementById('vr-nav').addEventListener('click', hideSidebar);

}

createSidebarToggle();
hideSidebar();
createEventListeners();

