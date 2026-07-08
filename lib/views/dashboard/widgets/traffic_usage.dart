import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/providers/app.dart';
import 'package:fl_clash/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TrafficUsage extends StatelessWidget {
  const TrafficUsage({super.key});

  Widget _buildTrafficDataItem(
    BuildContext context,
    IconData iconData,
    Color color,
    String label,
    num trafficValue,
  ) {
    final traffic = trafficValue.traffic;
    return Expanded(
      child: Row(
        children: [
          Icon(iconData, color: color, size: 16),
          const SizedBox(width: 8),
          Text(
            label,
            style: context.textTheme.bodySmall?.copyWith(color: color),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                traffic.value,
                style: context.textTheme.bodyMedium?.toSoftBold,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(traffic.unit, style: context.textTheme.bodySmall?.toLighter),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = context.appLocalizations;
    final primaryColor = context.colorScheme.primary;
    final secondaryColor = context.colorScheme.secondary;
    return SizedBox(
      height: getWidgetHeight(2),
      child: RepaintBoundary(
        child: CommonCard(
          info: Info(
            label: appLocalizations.trafficUsage,
            iconData: Icons.data_saver_off,
          ),
          onPressed: () {},
          child: Consumer(
            builder: (_, ref, _) {
              final totalTraffic = ref.watch(totalTrafficProvider);
              final upTotalTrafficValue = totalTraffic.up;
              final downTotalTrafficValue = totalTraffic.down;
              return Padding(
                padding: baseInfoEdgeInsets.copyWith(top: 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTrafficDataItem(
                      context,
                      Icons.arrow_upward,
                      primaryColor,
                      appLocalizations.upload,
                      upTotalTrafficValue,
                    ),
                    const SizedBox(height: 8),
                    _buildTrafficDataItem(
                      context,
                      Icons.arrow_downward,
                      secondaryColor,
                      appLocalizations.download,
                      downTotalTrafficValue,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
