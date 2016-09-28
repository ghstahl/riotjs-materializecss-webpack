import '../layouts/sidebar-materializecss.tag';
import '../components/loading-indicator.tag';

<app>
    <loading-indicator></loading-indicator>
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
            {name:'Movies',href:'#home',view : 'home',materialIcon:'toll'},
            {name:'Name 2',href:'#projects',view : 'projects'},
            {name:'Drag&Drop',href:'#drag-drop',view : 'drag-drop'}

        ]
    </script>

</app>

