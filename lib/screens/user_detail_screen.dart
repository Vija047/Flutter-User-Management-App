import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/api_service.dart';

class UserDetailScreen extends StatefulWidget {
  final User user;

  const UserDetailScreen({super.key, required this.user});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ApiService _apiService = ApiService();
  Map<String, dynamic>? _posts;
  Map<String, dynamic>? _todos;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      final posts = await _apiService.getUserPosts(widget.user.id);
      final todos = await _apiService.getUserTodos(widget.user.id);
      setState(() {
        _posts = posts;
        _todos = todos;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading user data: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.user.firstName} ${widget.user.lastName}'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Profile'),
            Tab(text: 'Posts'),
            Tab(text: 'Todos'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildProfileTab(),
          _buildPostsTab(),
          _buildTodosTab(),
        ],
      ),
    );
  }

  Widget _buildProfileTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(widget.user.image),
          ),
          const SizedBox(height: 16),
          Text(
            '${widget.user.firstName} ${widget.user.lastName}',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(widget.user.email),
        ],
      ),
    );
  }

  Widget _buildPostsTab() {
    if (_posts == null) {
      return const Center(child: CircularProgressIndicator());
    }
    final posts = _posts!['posts'] as List;
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            title: Text(post['title']),
            subtitle: Text(post['body']),
          ),
        );
      },
    );
  }

  Widget _buildTodosTab() {
    if (_todos == null) {
      return const Center(child: CircularProgressIndicator());
    }
    final todos = _todos!['todos'] as List;
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return CheckboxListTile(
          title: Text(todo['todo']),
          value: todo['completed'],
          onChanged: null,
        );
      },
    );
  }
}
