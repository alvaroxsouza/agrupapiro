// import 'package:agrupapiro/models/Activity.dart';
// import 'package:agrupapiro/view/activity_detail_page.dart';
// import 'package:flutter/material.dart';



// class ActivityCard extends StatelessWidget {
//   final Activity activity;

//   const ActivityCard({Key? key, required this.activity}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: activity.color.shade50,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: InkWell(
//         onTap: () => Navigator.of(context).push(
//           MaterialPageRoute(
//             builder: (context) => ActivityDetailsPage(activity: activity),
//           ),
//         ),
//         borderRadius: BorderRadius.circular(8),
//         splashColor: activity.color.shade100,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Título da Atividade
//               Text(
//                 activity.title,
//                 style: Theme.of(context).textTheme.titleSmall,
//               ),
//               const SizedBox(height: 8),

//               // Nome do Usuário Responsável
//               Text(
//                 'Responsável: ${activity.user.name}',
//                 style: Theme.of(context).textTheme.bodySmall,
//               ),
//               const SizedBox(height: 8),

//               // Prazo da Atividade
//               Text(
//                 'Prazo: ${activity.deadline.toLocal().toString().split(' ')[0]}',
//                 style: Theme.of(context).textTheme.bodySmall,
//               ),
//               const SizedBox(height: 8),

//               // Prioridade da Atividade
//               Text(
//                 'Prioridade: ${activity.prioridade.name}',
//                 style: Theme.of(context).textTheme.bodySmall,
//               ),
//               const SizedBox(height: 16),

//               // Descrição da Atividade
//               Container(
//                 constraints: const BoxConstraints(
//                   maxHeight: 150,
//                   minHeight: 0,
//                 ),
//                 clipBehavior: Clip.none,
//                 child: Text(
//                   activity.description,
//                   overflow: TextOverflow.fade,
//                   style: Theme.of(context).textTheme.bodySmall,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
      
//     );
    
//   }
// }
