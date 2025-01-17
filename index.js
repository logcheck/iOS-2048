import React from 'react';
import moment from 'moment';
import {FlatList, AppRegistry, StyleSheet, Text, View, Button, NativeModules} from 'react-native';

class RNHighScores extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      scores: props.scores
    };

    this._exitButtonPressed = this._exitButtonPressed.bind(this);
    this._clearButtonPressed = this._clearButtonPressed.bind(this);
  }

  _exitButtonPressed() {
    NativeModules.F3HBridgeModule.exitHighScoreButtonTapped(this.state.scores)
  }

  _clearButtonPressed() {
    this.setState({
      scores: []
    })
  }

  render() {
    var scores = this.state.scores;

    var scores = scores.map((score) => {
      score['key'] = score['createdAt'];
      return score;
    })

    var contents = (scores.length > 0) ?
      <FlatList
        data={scores}
        renderItem={(({item}) => {
          return <Text style={styles.item}>{moment(item.createdAt).format('MM/DD/YY hh:mm:ss A')} - {item.value}</Text>
        })}
      />
    :
      <Text>No scores yet!</Text>
    ;

    return (
      <View style={styles.container}>
        <Text style={styles.highScoresTitle}>2048 High Scores!</Text>
        {contents}
        <Button title={'Clear'} onPress={this._clearButtonPressed}>
          <Text>Clear</Text>
        </Button>
        <Button title={'Exit'} onPress={this._exitButtonPressed}>
          <Text>Exit</Text>
        </Button>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  item: {
    textAlign: 'left',
    backgroundColor: '#DDD',
    fontSize: 20,
    marginBottom: 5
  },
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'stretch',
    backgroundColor: '#FFFFFF',
  },
  highScoresTitle: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  scores: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

// Module name
AppRegistry.registerComponent('RNHighScores', () => RNHighScores);
