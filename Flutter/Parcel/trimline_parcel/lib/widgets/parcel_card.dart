import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trimline_parcel/models/parcel_model.dart';
import 'package:trimline_parcel/pages/add_parcel_page.dart';
import 'package:trimline_parcel/utilities/status_color.dart';

class ParcelCard extends StatelessWidget {
  const ParcelCard({Key? key,this.parcel}) : super(key: key);

  final Parcel? parcel;

  @override
  Widget build(BuildContext context) {
    return ListTile
                  (
                    contentPadding: const EdgeInsets.all(8),
                    title: Row(
                      children: [
                        Text(
                        '${parcel?.Document_No}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                                            ), 
                                            const Spacer(),
                                            Text(
                              parcel!.Date_sent.toString().split(' ')[0],
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                      ],
                    ),  
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                     Row(
                      children: [ 
                        RichText(
                        text: TextSpan(
                          text: 'From: ',
                         style: const TextStyle(
                           fontWeight: FontWeight.normal,
                           fontSize: 16,
                           color: Colors.black
                         ),
                          children: [
                            TextSpan(
                              text: '${parcel?.From}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,fontSize: 16,
                                color: Colors.black
                              ),
                            ),
                            ],
                        ),
                      ),
                      const Spacer(),
                        RichText(
                        text: TextSpan(
                          text: 'To: ',
                         style: const TextStyle(
                           fontWeight: FontWeight.normal,
                           fontSize: 16,
                           color: Colors.black
                         ),
                          children: [
                            TextSpan(
                              text: '${parcel?.To}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,fontSize: 16,
                                color: Colors.black
                              ),
                            ),
                         
                          ],
                        ),
                      )
                      ]),
                      Row(
                        children: [
                       Column(
                       children: [ 
                             Text('${parcel?.Sender_Name}',style: const TextStyle(
                               fontSize: 16,
                               fontWeight: FontWeight.bold,
                               color: Colors.black
                             ),),
                             Text('${parcel?.Sender_Phone}',style: const TextStyle(
                               fontSize: 16,
                               fontWeight: FontWeight.bold,
                               color: Colors.black
                             ),),
                             ]),
                                      const Spacer(),
                                  Column(
                                    children: [
                                  Text('${parcel?.Receiver_Name}',style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  ),),
                                  Text('${parcel?.Receiver_Phone}',style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                  ),),
                        ])]),
                           
                           
                            Text('Driver: ${parcel?.Driver} (${parcel?.Vehicle})'),
                        
                        
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: GetStatusColor(parcel!.Status).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                parcel!.Status.toString().split('.').last,
                                style: TextStyle(
                                  color: GetStatusColor(parcel!.Status),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Text(
                              'Sent: ${parcel!.Date_sent.toString().split(' ')[0]}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                           
                          ],
                        ),
                      ]),
                    
                    onTap: () {
                      // Navigate to AddParcelPage in edit mode
                      if (parcel!.Status == ParcelStatus.pending) {
                      Get.to(() => AddParcelPage(parcel: parcel));
                      }
                      else {
                        Get.snackbar('Error', 'Parcel cannot be edited', backgroundColor: Colors.red
                        ,
                        );
                      }
                    },
                  );
              }
}