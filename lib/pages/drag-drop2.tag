
import Sortable from '../js/Sortable.min.js';

<drag-drop2>

        <ul class="collection" id="roleA">
            <li each={_itemsRoleA} data-role="{name}" class="collection-item">
                 {name}
            </li>
        </ul>
        <ul class="collection" id="roleB">
            <li each={_itemsRoleB} data-role="{name}" class="collection-item">
                {name}
            </li>
        </ul>
        <ul class="collection" id="roleFinal">
            <li each={_itemsRoleFinal} class="collection-item avatar">

                <img src="images/graduation.png" alt="" class="circle">
                <span class="title">{name}</span>
                <p>First Line <br>
                    Second Line
                </p>
                <a href="#!" class="secondary-content"><i class="material-icons">grade</i></a>
            </li>

        </ul>

        <button class="btn waves-effect waves-light" onclick="{updateRoles}"  >Submit</button>


    <style >



    .sortable-ghost {
        opacity: .3;
        background: #f60;
    }


    #roleA,#roleB,#roleFinal {
        border: 2px dashed #f60;
        min-height: 100px
    }

</style>
    <script>
        var self = this

        self.updateRoles = () =>{

            console.log(self.roleFinal)
        }

        self.inPlayItem = null;

        self._itemsRoleA = [
            { name: 'Administrator' },
            { name: 'Developer' },
            { name: 'User' }
        ]
        self._itemsRoleB = [
            { name: 'Dog' },
            { name: 'Cat' },
            { name: 'Mouse' }
        ]
        self._itemsRoleFinal = [
            { name: 'Administrator' }
        ]

        self.emptyUL = (ul) => {

            var lis = ul.getElementsByTagName("li");
            while(lis.length> 0){
                ul.removeChild(lis[0]);
                lis = ul.getElementsByTagName("li");
            }
        }
        self.on('mount', function() {

            Sortable.create(self.roleA, {
                group: {
                    name: 'roles',
                    pull: 'clone',
                    put: false
                },
                sort:false,
                onStart: function (/**Event*/evt) {
                    var newItem = self._itemsRoleA[evt.oldIndex];
                    self.inPlayItem = newItem;
                }
            });
            Sortable.create(self.roleB, {
                group: {
                    name: 'roles',
                    pull: 'clone',
                    put: false
                },
                sort:false,
                onStart: function (/**Event*/evt) {
                    var newItem = self._itemsRoleB[evt.oldIndex];
                    self.inPlayItem = newItem;
                }
            });
            Sortable.create(self.roleFinal, {
                group: {
                    name: 'roles',
                    pull: false
                },
                sort:false,
                onAdd: function (evt) {
                    var el = evt.item;
                    var roleName = el.getAttribute("data-role");
                    console.log(roleName);

                    // is it in our backing array
                    var item = self._itemsRoleFinal.find(x => x.name === roleName);
                    if (item) {
                        console.log("This item already exists");
                    }
                    else {
                        self._itemsRoleFinal.push(self.inPlayItem);
                    }
                    self.emptyUL(self.roleFinal);
                    var temp = self._itemsRoleFinal;
                    self._itemsRoleFinal = [];
                    self.update();
                    self._itemsRoleFinal = temp;
                    self.update();
                }
            });
        })
    </script>
</drag-drop2>
