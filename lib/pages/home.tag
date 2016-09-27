import 'whatwg-fetch';

<home>

      <form onsubmit={ search }>
        <label>
          <span>
            Search a movie
          </span>
          <!-- Textfield with Floating Label -->



          <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
          <input
                    oninput={ search }
                    onchange={ search }
                    name='s'
                    placeholder='28 Days Later..'
                    type='search' />

        </div>

        <div if={ results.length }>
          <table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp">
            <thead>
            <tr>
              <th class="mdl-data-table__cell--non-numeric">Title</th>
              <th>Year</th>
              <th>Unit price</th>
            </tr>
            </thead>
            <tbody>
            <tr each={ this.results }>
              <td class="mdl-data-table__cell--non-numeric">{ this.Title }</td>
              <td>{ this.Year }</td>
              <td>$2.90</td>
            </tr>
            </tbody>
          </table>
        </div>
          <p class='error' if={ error }>{ error }</p>

          <div if={ results.length }>
            <ul>
              <li each={ results }>
                <div class="mdl-card mdl-shadow--2dp demo-card-square">
                  <div class="mdl-card__title mdl-card--expand">
                    <image src="{Poster}">
                  </div>
                  <div class="mdl-card__supporting-text">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                    Aenan convallis.
                  </div>
                  <div class="mdl-card__actions mdl-card--border">
                    <a class="mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect">
                      View Updates
                    </a>
                  </div>
                </div>

                <a href="http://www.imdb.com/title/{ imdbID }" target="_blank">{ Title }</a>
                <span>{ Year }</span>
              </li>
            </ul>
          </div>


  <script >
    this.lastSearch = null;
    this.error = false;
    this.results = [];
    /**
     * Reset tag attributes to hide the errors and cleaning the results list
     */
    this.resetData = function() {
      this.results = [];
      this.error = false;
    }
    /**
     * Debounce the api requests
     */
    this.doApiRequest = function(search) {

      var self = this;
      var url = 'http://www.omdbapi.com/?s=' + search;
      fetch(url).then(function (response) {
        return response.json();
      }).then(function (data) {
        self.results = data.Search;
        console.log(data.Search);
      }).catch(function () {
        console.log("Booo");
      });

    }
    /**
     * Public api/methods
     */



    /**
     * Search callback
     */
    this.search = function(e) {

      var search = this.s.value

      if (!search) {
        this.resetData()
      } else if (this.lastSearch != search && search.length > 1)  {
        this.resetData()
        this.isLoading = true
        this.doApiRequest(search)
      }

      this.lastSearch = search
    }
  </script>

</home>
