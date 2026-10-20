import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../data/listings.dart';
import '../theme/tokens.dart';
import '../widgets/app_footer.dart';
import '../widgets/app_header.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/brand_rail.dart';
import '../widgets/hero_banner.dart';
import '../widgets/list_options.dart';
import '../widgets/listing_card.dart';
import '../widgets/pagination.dart';
import '../widgets/quick_filters.dart';
import '../widgets/section_tabs.dart';

/// 시안 폭 (412px). 더 좁은 화면에서는 FittedBox 로 비례 축소한다.
const designWidth = 412.0;

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final _scroll = ScrollController();

  int _tab = 0;
  bool _categoryVisible = true;
  final Set<int> _activeFilters = {};
  int? _brand;
  int? _theme;
  SortKey _sort = SortKey.updated;
  bool _grid = false;
  final Set<int> _wished = {};
  int _page = 1;
  int _nav = 0;
  bool _businessOpen = false;
  bool _dark = false;

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  void _toast(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(message, style: bb(14, w500, 20, BbColors.white)),
        duration: const Duration(milliseconds: 1400),
        behavior: SnackBarBehavior.floating,
        width: 320,
        backgroundColor: BbColors.textStrong,
      ));
  }

  Future<void> _pickSort() async {
    final picked = await showModalBottomSheet<SortKey>(
      context: context,
      backgroundColor: BbColors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      constraints: const BoxConstraints(maxWidth: designWidth),
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('정렬', style: bb(16, w700, 22, BbColors.textStrong)),
              ),
            ),
            for (final key in SortKey.values)
              ListTile(
                title: Text(key.label,
                    style: bb(15, key == _sort ? w700 : w400, 22, BbColors.textStrong)),
                trailing: key == _sort ? const Icon(Icons.check, size: 20, color: BbColors.textStrong) : null,
                onTap: () => Navigator.pop(context, key),
              ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
    if (picked != null && mounted) setState(() => _sort = picked);
  }

  void _goPage(int page) {
    if (page == _page) return;
    setState(() => _page = page);
    _scroll.animateTo(0, duration: const Duration(milliseconds: 350), curve: Curves.easeOut);
    _toast('$page페이지 (데모 데이터는 1페이지와 동일)');
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final frameWidth = math.min(designWidth, screenWidth);
    final cars = sortedListings(_sort);

    return Scaffold(
      backgroundColor: BbColors.pageBg,
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              controller: _scroll,
              child: Center(
                child: SizedBox(
                  width: frameWidth,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: designWidth,
                      child: ColoredBox(
                        color: BbColors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppHeader(
                              onWishlist: () => _toast('찜한 매물 ${_wished.length}대'),
                              onSearch: (q) => _toast(q.trim().isEmpty ? '검색어를 입력해 주세요' : '"$q" 검색 (데모)'),
                            ),
                            const HeroBanner(),
                            SectionTabs(
                              selected: _tab,
                              onSelect: (i) {
                                setState(() => _tab = i);
                                if (i != 0) _toast('${sectionTabLabels[i]} 탭 (데모)');
                              },
                            ),
                            QuickFilters(
                              categoryVisible: _categoryVisible,
                              activeFilters: _activeFilters,
                              onClearCategory: () => setState(() => _categoryVisible = false),
                              onToggleFilter: (i) => setState(() {
                                if (!_activeFilters.remove(i)) _activeFilters.add(i);
                              }),
                              onFilterButton: () => setState(() {
                                _categoryVisible = true;
                                _activeFilters.clear();
                                _brand = null;
                                _theme = null;
                                _toast('필터를 초기화했어요');
                              }),
                            ),
                            BrandRail(
                              selected: _brand,
                              onSelect: (i) => setState(() {
                                _brand = _brand == i ? null : i;
                                if (_brand != null) _toast('${brands[i].name} (${brands[i].count}대)');
                              }),
                            ),
                            ListOptions(
                              selectedTheme: _theme,
                              onSelectTheme: (i) => setState(() => _theme = _theme == i ? null : i),
                              sortKey: _sort,
                              onSortTap: _pickSort,
                              gridMode: _grid,
                              onGridTap: () {
                                setState(() => _grid = !_grid);
                                _toast(_grid ? '그리드 보기 (데모)' : '리스트 보기');
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Column(
                                children: [
                                  for (final car in cars)
                                    ListingCard(
                                      car: car,
                                      wished: _wished.contains(car.id),
                                      onWish: () => setState(() {
                                        if (!_wished.remove(car.id)) _wished.add(car.id);
                                      }),
                                      onTap: () => _toast(car.title),
                                    ),
                                ],
                              ),
                            ),
                            Pagination(page: _page, pageCount: 2, onPage: _goPage),
                            const SizedBox(height: 24, width: designWidth),
                            AppFooter(
                              businessOpen: _businessOpen,
                              onToggleBusiness: () => setState(() => _businessOpen = !_businessOpen),
                              darkMode: _dark,
                              onDarkMode: (v) {
                                setState(() => _dark = v);
                                _toast(v ? '다크 모드는 준비 중이에요' : '라이트 모드');
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Center(
              child: SizedBox(
                width: frameWidth,
                child: FittedBox(
                  fit: BoxFit.contain,
                  alignment: Alignment.bottomCenter,
                  child: BottomNav(
                    index: _nav,
                    onSelect: (i) {
                      setState(() => _nav = i);
                      const names = ['홈', '채팅', '매물등록', '커뮤니티', '마이'];
                      if (i != 0) _toast('${names[i]} (데모)');
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
