import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/tour_detail_cubit.dart';
import '../cubit/tour_detail_state.dart';

class TourDetailScreen extends StatefulWidget {
  final String slug;

  const TourDetailScreen({super.key, required this.slug});

  @override
  State<TourDetailScreen> createState() => _TourDetailScreenState();
}

class _TourDetailScreenState extends State<TourDetailScreen> {
  @override
  void initState() {
    super.initState();
    context.read<TourDetailCubit>().loadTourDetail(widget.slug);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tour Details')),
      body: BlocBuilder<TourDetailCubit, TourDetailState>(
        builder: (context, state) {
          if (state is TourDetailLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TourDetailNotFound) {
            return Center(child: Text(state.message));
          } else if (state is TourDetailError) {
            return Center(child: Text(state.message));
          } else if (state is TourDetailSuccess) {
            return Center(
              child: Text(
                'Loaded Package: ${state.package.title.displayValue}',
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
