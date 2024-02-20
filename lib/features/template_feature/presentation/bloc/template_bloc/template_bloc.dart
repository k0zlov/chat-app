import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'template_event.dart';
part 'template_state.dart';

class TemplateBloc extends Bloc<TemplateEvent, TemplateState> {
  TemplateBloc() : super(TemplateInitial()) {
    on<TemplateEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
