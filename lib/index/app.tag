import '../layouts/sidebar-materializecss.tag';


<app>
    <sidebar-materializecss title={this.title} menuItems = {this.menuItems}>
        <yield to="content">
            <div id="riot-subview"></div>
        </yield>
    </sidebar-materializecss>

    <script >
        this.on('mount', function(){

            console.log('app Mounted') // Succeeds, fires once (per mount)
        })
        this.title = "Developer"
        this.menuItems = [
            {name:'Name 1',href:'#home',view : 'home',materialIcon:'toll'},
            {name:'Name 2',href:'#projects',view : 'projects'}
        ]
    </script>

</app>