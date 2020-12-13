import 'package:portfolio/generated/l10n.dart';
import 'package:portfolio/models/node_data.dart';

List<NodeData> get nodes => [_iut, _cegep, _ets, _pvp, _intact, _nbc];

// Éducation
NodeData _iut = NodeData(
    startingAt: DateTime.parse("2015-09-01"),
    endingAt: DateTime.parse("2017-06-01"),
    title: AppIntl.current.journey_iut_title,
    shortTitle: AppIntl.current.journey_iut_short_title,
    description: AppIntl.current.journey_iut_description);

NodeData _cegep = NodeData(
    basedOn: _iut,
    startingAt: DateTime.parse("2017-01-01"),
    endingAt: DateTime.parse("2017-12-01"),
    title: AppIntl.current.journey_cegep_title,
    shortTitle: AppIntl.current.journey_cegep_short_title,
    description: AppIntl.current.journey_cegep_description);

NodeData _ets = NodeData(
    startingAt: DateTime.parse("2018-01-01"),
    title: AppIntl.current.journey_ets_title,
    shortTitle: AppIntl.current.journey_ets_short_title,
    description: AppIntl.current.journey_ets_description);

// Experiences
NodeData _pvp = NodeData(
    startingAt: DateTime.parse("2017-03-01"),
    endingAt: DateTime.parse("2017-12-01"),
    title: AppIntl.current.journey_pvp_title,
    shortTitle: AppIntl.current.journey_pvp_short_title,
    description: AppIntl.current.journey_pvp_description,
    isOnLeft: false);

NodeData _intact = NodeData(
    startingAt: DateTime.parse("2018-09-01"),
    endingAt: DateTime.parse("2019-05-01"),
    title: AppIntl.current.journey_intact_title,
    shortTitle: AppIntl.current.journey_intact_short_title,
    description: AppIntl.current.journey_intact_description,
    isOnLeft: false);

NodeData _nbc = NodeData(
    startingAt: DateTime.parse("2019-05-01"),
    title: AppIntl.current.journey_nbc_title,
    shortTitle: AppIntl.current.journey_nbc_short_title,
    description: AppIntl.current.journey_nbc_description,
    isOnLeft: false);
