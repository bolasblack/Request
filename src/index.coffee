
React = require 'react-native'
SearchBar = require './search_bar.coffee'
{
  AppRegistry,
  Image,
  ListView,
  StyleSheet,
  Text,
  TextInput,
  View
} = React

App = React.createClass(
  _onBlur: ->
    console.log 'blur'

  _onFocus: ->
    console.log 'focus'

  _onChange: ->
    console.log 'change'

  render: ->
    <View style={styles.container}>
      <SearchBar placeholder="Search"
        selectTextOnFocus={true}
        onBlur={@_onBlur}
        onFocus={@_onFocus}
        onChange={@_onChange} />
    </View>
)

styles = StyleSheet.create(
  container:
    marginTop: 20
    # flex: 1
    # flexDirection: 'row'
    # justifyContent: 'center'
    # alignItems: 'center'
    # backgroundColor: '#000'
)

AppRegistry.registerComponent('Request', => App)
