React = require 'react-native'
{requireNativeComponent} = React

class SearchBar extends React.Component
  render: ->
    <RCTSearchBar {...@props} />

  @propTypes:
    selectTextOnFocus: React.PropTypes.bool
    showsCancelButton: React.PropTypes.bool
    searchBarStyle: React.PropTypes.string
    placeholder: React.PropTypes.string

    onBlur: React.PropTypes.func
    onFocus: React.PropTypes.func
    onChange: React.PropTypes.func

RCTSearchBar = requireNativeComponent 'RCTSearchBar', SearchBar

module.exports = SearchBar
