import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedbackPagePhy extends StatefulWidget {
  @override
  _FeedbackPagePhyState createState() => _FeedbackPagePhyState();
}

class _FeedbackPagePhyState extends State<FeedbackPagePhy> {
  static const TextStyle White20Style = TextStyle(
      fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold);

  List<String> _comments = [];

  void _addComment(String val) {
    setState(() {
      _comments.add(val);
    });
  }

  Widget _buildCommentList() {
    // ignore: missing_return
    return ListView.builder(itemBuilder: (context, index) {
      if (index < _comments.length) {
        return _buildCommentItem(_comments[index]);
      }
    });
  }

  Widget _buildCommentItem(String comment) {
    return ListTile(title: Text(comment));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Feedback",
          style: GoogleFonts.alice(textStyle: White20Style),
        ),
        backgroundColor: Colors.indigo[900],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: _buildCommentList(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onSubmitted: (String submittedStr){
                _addComment(submittedStr);
              },
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1.0)),
                  contentPadding: const EdgeInsets.all(20.0),
                  hintText: "Add Feedback"
              ),
            ),
          ),
        ],
      ),
    );
  }
}
