
import Sortable from '../js/Sortable.min.js';

<drag-drop>
    <ul id="list">
        <li style="cursor: pointer;" each={_items}>{name}</li>
    </ul>
    <hr>
    <div id="hlist">
        <span each={_items}>{name} | </span>
    </div>
    <hr>
    <ul id="listA">
        <li each={_itemsListA}>{name}</li>
    </ul>
    <ul id="listC">
        <li each={_itemsListC}>{name}</li>
    </ul>
    <hr>
    <button onclick={moveLastToFirst}>Move Last To First</button>
<style>
    ul {
        list-style: none;
        padding: 0;
    }

    li {
        background: #eee;
        margin: 1px;
        padding: 10px 15px;
        cursor: move;
        border-radius: 5px;
    }

    .sortable-ghost {
        opacity: .3;
        background: #f60;
    }


    #listC {
        border: 2px dashed #f60;
        min-height: 100px
    }
</style>
    <script>
        var self = this

        self._items = [
            { name: 'c#' },
            { name: 'swift' },
            { name: 'golang' },
            { name: 'python' },
            { name: 'javascript' }
        ]

        self.inPlayItem = null;

        self._itemsListA = [
            { name: 'c#' },
            { name: 'swift' },
            { name: 'golang' },
            { name: 'python' },
            { name: 'javascript' }
        ]
        self._itemsListC= [
            { name: 'javascript' }
        ]

        var sortableOption = {
            onEnd: function (evt) {
                console.log('move from', evt.oldIndex, 'to', evt.newIndex)
                self._items.splice(evt.newIndex, 0, self._items.splice(evt.oldIndex, 1)[0])
                var temp = self._items
                self._items = []
                self.update()
                self._items = temp
                self.update()
            }
        }
        var sortableSharedOption = {
            group: 'shared',
            onEnd: function (evt) {
                console.log(evt);
                console.log('move from', evt.oldIndex, 'to', evt.newIndex)
                self._items.splice(evt.newIndex, 0, self._items.splice(evt.oldIndex, 1)[0])
                var temp = self._items
                self._items = []
                self.update()
                self._items = temp
                self.update()
            }
        }
        this.moveLastToFirst = () =>{
            self._items.splice(0, 0, self._items.splice(self._items.length-1, 1)[0])
            console.log(self._items)
        }
        self.on('mount', function() {
            Sortable.create(self.list, sortableOption)
            Sortable.create(self.hlist, sortableOption)
            Sortable.create(self.listA, {
                group: {
                    name: 'shared',
                    pull: 'clone',
                    put: false,
                },
                sort: false,
                onStart: function (/**Event*/evt) {
                    var newItem = self._itemsListA[evt.oldIndex];
                    self.inPlayItem = newItem;
                },
                onMove: function (/**Event*/evt) {
                    var item = self._itemsListC.find(x => x.name === self.inPlayItem.name);
                    if(item){
                        return false;
                    }
                }
            });
            Sortable.create(self.listC, {
                group: 'shared',
                sort: false,
                onMove: function (/**Event*/evt) {
                    console.log(evt)
                },
                onAdd: function (evt) {
                    var newItem = self._itemsListA[evt.oldIndex];
                    var item = self._itemsListC.find(x => x.name === newItem.name);
                    if (item) {
                        console.log("This item already exists");
                    }
                    else {
                        self._itemsListC.push(newItem);
                    }
                }
            });
        })
    </script>
</drag-drop>
