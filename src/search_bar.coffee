React = require 'react-native'
{requireNativeComponent, StyleSheet, NativeModules} = React
SearchBarIOSConsts = NativeModules.UIManager.RCTSearchBar.Constants

class SearchBar extends React.Component
  render: ->
    <RCTSearchBar style={{height: SearchBarIOSConsts.ComponentHeight}} {...@props} />

  @propTypes:
    selectTextOnFocus: React.PropTypes.bool
    showsCancelButton: React.PropTypes.bool
    searchBarStyle: React.PropTypes.string
    placeholder: React.PropTypes.string

    onBlur: React.PropTypes.func
    onFocus: React.PropTypes.func
    onChange: React.PropTypes.func

RCTSearchBar = requireNativeComponent 'RCTSearchBar', SearchBar

styles = StyleSheet.create(
  rctSearchBarIOS:
    width: SearchBarIOSConsts.ComponentWidth
    height: SearchBarIOSConsts.ComponentHeight
)

module.exports = SearchBar
