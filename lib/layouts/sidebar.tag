<sidebar>
    <div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
        <header class="demo-header mdl-layout__header mdl-color--grey-100 mdl-color-text--grey-600">
            <div class="mdl-layout__header-row">
                <span class="mdl-layout-title">{opts.title}</span>
                <div class="mdl-layout-spacer"></div>

                <button class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon" id="hdrbtn">
                    <i class="material-icons">more_vert</i>
                </button>
                <ul class="mdl-menu mdl-js-menu mdl-js-ripple-effect mdl-menu--bottom-right" for="hdrbtn">
                    <li class="mdl-menu__item">About</li>
                    <li class="mdl-menu__item">Contact</li>
                    <li class="mdl-menu__item">Legal information</li>
                </ul>
            </div>
        </header>
        <div class="demo-drawer mdl-layout__drawer mdl-color--blue-grey-900 mdl-color-text--blue-grey-50">
            <header class="demo-drawer-header">
                <img src="images/user.jpg" class="demo-avatar">
                <div class="demo-avatar-dropdown">
                    <span>hello@example.com</span>
                    <div class="mdl-layout-spacer"></div>
                    <button id="accbtn" class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-button--icon">
                        <i class="material-icons" role="presentation">arrow_drop_down</i>
                        <span class="visuallyhidden">Accounts</span>
                    </button>
                    <ul class="mdl-menu mdl-menu--bottom-right mdl-js-menu mdl-js-ripple-effect" for="accbtn">
                        <li class="mdl-menu__item">hello@example.com</li>
                        <li class="mdl-menu__item">info@example.com</li>
                        <li class="mdl-menu__item"><i class="material-icons">add</i>Add another account...</li>
                    </ul>
                </div>
            </header>
            <nav class="demo-navigation mdl-navigation mdl-color--blue-grey-800">
                <a class="mdl-navigation__link" each={ parent.menuItems } href={this.href}>
                    <i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">{this.materialIcon}</i>{ this.name }
                </a>
                <div class="mdl-layout-spacer"></div>
                <a class="mdl-navigation__link" href=""><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">help_outline</i><span class="visuallyhidden">Help</span></a>
            </nav>
        </div>
        <main class="mdl-layout__content mdl-color--grey-100">
            <div class="mdl-grid demo-content">
                <div class="demo-charts mdl-color--white mdl-shadow--2dp mdl-cell mdl-cell--12-col mdl-grid">
                    <yield from="content"/>
                </div>
                <div class="demo-graphs mdl-shadow--2dp mdl-color--white mdl-cell mdl-cell--8-col">
                    <svg fill="currentColor" viewBox="0 0 500 250" class="demo-graph">
                        <use xlink:href="#chart" />
                    </svg>
                    <svg fill="currentColor" viewBox="0 0 500 250" class="demo-graph">
                        <use xlink:href="#chart" />
                    </svg>
                </div>
                <div class="demo-cards mdl-cell mdl-cell--4-col mdl-cell--8-col-tablet mdl-grid mdl-grid--no-spacing">
                    <div class="demo-updates mdl-card mdl-shadow--2dp mdl-cell mdl-cell--4-col mdl-cell--4-col-tablet mdl-cell--12-col-desktop">
                        <div class="mdl-card__title mdl-card--expand mdl-color--teal-300">
                            <h2 class="mdl-card__title-text">Updates</h2>
                        </div>
                        <div class="mdl-card__supporting-text mdl-color-text--grey-600">
                            Non dolore elit adipisicing ea reprehenderit consectetur culpa.
                        </div>
                        <div class="mdl-card__actions mdl-card--border">
                            <a href="#" class="mdl-button mdl-js-button mdl-js-ripple-effect">Read More</a>
                        </div>
                    </div>
                    <div class="demo-separator mdl-cell--1-col"></div>
                    <div class="demo-options mdl-card mdl-color--deep-purple-500 mdl-shadow--2dp mdl-cell mdl-cell--4-col mdl-cell--3-col-tablet mdl-cell--12-col-desktop">
                        <div class="mdl-card__supporting-text mdl-color-text--blue-grey-50">
                            <h3>View options</h3>
                            <ul>
                                <li>
                                    <label for="chkbox1" class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect">
                                        <input type="checkbox" id="chkbox1" class="mdl-checkbox__input">
                                        <span class="mdl-checkbox__label">Click per object</span>
                                    </label>
                                </li>
                                <li>
                                    <label for="chkbox2" class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect">
                                        <input type="checkbox" id="chkbox2" class="mdl-checkbox__input">
                                        <span class="mdl-checkbox__label">Views per object</span>
                                    </label>
                                </li>
                                <li>
                                    <label for="chkbox3" class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect">
                                        <input type="checkbox" id="chkbox3" class="mdl-checkbox__input">
                                        <span class="mdl-checkbox__label">Objects selected</span>
                                    </label>
                                </li>
                                <li>
                                    <label for="chkbox4" class="mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect">
                                        <input type="checkbox" id="chkbox4" class="mdl-checkbox__input">
                                        <span class="mdl-checkbox__label">Objects viewed</span>
                                    </label>
                                </li>
                            </ul>
                        </div>
                        <div class="mdl-card__actions mdl-card--border">
                            <a href="#" class="mdl-button mdl-js-button mdl-js-ripple-effect mdl-color-text--blue-grey-50">Change location</a>
                            <div class="mdl-layout-spacer"></div>
                            <i class="material-icons">location_on</i>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

    this.title = opts.title
    this.menuItems = opts.menuItems;

</sidebar>