import React from 'react';
import {AppRegistry, StyleSheet, Text, View, Button, NativeModules} from 'react-native';

class RNHighScores extends React.Component {

  _exitButtonPressed() {
    NativeModules.F3HBridgeModule.exitHighScoreButtonTapped()
  }

  render() {
    var contents = this.props['scores'].map((score, i) => (
      <Text key={'score-' + i}>
        {score}
        {"\n"}
      </Text>
    ));
    return (
      <View style={styles.container}>
        <Text style={styles.highScoresTitle}>2048 High Scores!</Text>
        <Text style={styles.scores}>{contents}</Text>
        <Button title={'Exit'} onPress={this._exitButtonPressed}>
          <Text>Exit</Text>
        </Button>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
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
